# -*- coding: utf-8 -*-
# Copyright 2018 - 2019 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

import os
import yaml
import jinja2


class SaltDoc:
    def __init__(self, file_roots='../file_roots', pillar_roots='../pillar_roots',
                 source='docs/source'):
        self.docs_source = source
        self.file_roots = file_roots
        self.pillar_roots = pillar_roots
        self.env = jinja2.Environment(
            loader=jinja2.FileSystemLoader('.')
        )

    def template_sls(self, title, sls, literalinclude, language='salt'):
        template = self.env.get_template('template-sls.rst')
        if title:
            title = '%s\n%s' % (title, self.titlemarkup(title))
        return template.render(title=title, sls=sls, literalinclude=literalinclude,
                               language=language)

    def template_index(self, title, toc, maxdepth=4):
        template = self.env.get_template('template-index.rst')
        if title:
            title = '%s\n%s' % (title, self.titlemarkup(title))
        return template.render(title=title, toc=toc, maxdepth=maxdepth)

    @staticmethod
    def titlemarkup(title, heading='='):
        if title:
            return heading * len(title)

    @staticmethod
    def targets(roots):
        filename = '%s/top.sls' % roots
        if os.path.exists(filename):
            with open(filename, 'r') as content:
                try:
                    return yaml.load(content, yaml.FullLoader).get('base')
                except yaml.YAMLError as error:
                    print(error)
        return

    @staticmethod
    def get_title_from_first_comment(filename):
        if os.path.exists(filename):
            with open(filename, 'r') as content:
                first_line = content.readline()
                if first_line.startswith('# '):
                    return first_line.lstrip('# ').strip()

    def parse_states(self, folder, title):
        toc = []
        includes = self.parse_init(self.file_roots, folder)
        for include in includes:
            toc.append('../%s/index' % self.parse_include(include))
            sls = os.path.basename(self.parse_include(include))
            literalinclude = '../../../../../../file_roots/%s.sls' % self.parse_include(include)
            filename = '%s/file_roots/%s/index.rst' % (
                self.docs_source, self.parse_include(include))
            template = self.template_sls(
                self.get_title_from_first_comment(
                    '../file_roots/%s.sls' % self.parse_include(include)), sls, literalinclude
            )
            self.write_rst(filename, template)
            document_filename = '%s/file_roots/%s/%s.rst' % (
                self.docs_source, self.parse_include(include), sls)
            open(document_filename, 'a').close()
        filename = '%s/file_roots/%s/index.rst' % (self.docs_source, folder)
        template = self.template_index(title, toc)
        self.write_rst(filename, template)

    def parse_pillars(self, folder, title):
        toc = []
        includes = self.parse_init(self.pillar_roots, folder)
        if includes:
            for include in includes:
                toc.append('../%s/index' % self.parse_include(include))
                sls = os.path.basename(self.parse_include(include))
                literalinclude = '../../../../../../pillar_roots/%s.sls' % self.parse_include(include)
                filename = '%s/pillar_roots/%s/index.rst' % (
                    self.docs_source, self.parse_include(include))
                template = self.template_sls(
                    self.get_title_from_first_comment(
                        '../pillar_roots/%s.sls' % self.parse_include(include)), sls, literalinclude
                )
                self.write_rst(filename, template)
                document_filename = '%s/pillar_roots/%s/%s.rst' % (
                    self.docs_source, self.parse_include(include), sls)
                open(document_filename, 'a').close()
            filename = '%s/pillar_roots/%s/index.rst' % (self.docs_source, folder)
            template = self.template_index(title, toc)
            self.write_rst(filename, template)

    @staticmethod
    def write_rst(filename, template):
        if not os.path.exists(os.path.dirname(filename)):
            try:
                os.makedirs(os.path.dirname(filename))
            except OSError as exception:
                if exception.errno != errno.EEXIST:
                    raise
        with open(filename, "w") as handler:
            handler.write(template)

    def parse_init(self, roots, folder):
        filename = '%s/%s/init.sls' % (roots, folder)
        if os.path.exists(filename):
            with open(filename, 'r') as content:
                try:
                    return yaml.load(content, yaml.FullLoader).get('include')
                except yaml.YAMLError as error:
                    print(error)
        else:
            return self.parse_top(roots, folder)
        return

    @staticmethod
    def parse_include(include):
        if len(include.split('.')) > 0:
            elements = include.split('.')
            return '/'.join(elements)
        else:
            return

    def parse_top(self, roots, folder):
        targets = self.targets(roots)
        for target, states in targets.items():
            if folder in target:
                return states
        return
