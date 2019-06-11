#!/usr/bin/env python

import ast
import sys
import yaml


def extract_docs(filename):
    with open(filename, "rb") as fd:
        #sys.stderr.write(filename + "\n")
        content = fd.read()
        tree = ast.parse(content)

        for child in tree.body:
            if isinstance(child, ast.Assign):
                for t in child.targets:
                    try:
                        if t.id == "DOCUMENTATION":
                            docstring = child.value.s
                            return yaml.safe_load(docstring)
                    except:
                        pass


if __name__ == "__main__":
    for filename in sys.argv[1:]:
        docs = extract_docs(filename)

        if docs is None:
            continue

        for option, info in docs.get("options", dict()).items():
            print(option)

            for choice in info.get("choices", []):
                print(choice)
