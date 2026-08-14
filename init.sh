#!/bin/bash
input="$*"
cd "FILEPATH GOES HERE"
mkdir "$input"
cd $input
git init
mkdir "data"
mkdir "notebooks"
mkdir "tests"
mkdir "$input"

cd $input
cat > __init__.py <<EOF
EOF

cd ..

cat > .gitignore <<EOF
# Python bytecode cache
__pycache__/
*.pyc

# Packaging artifacts from pip install -e .
*.egg-info/
*.egg
build/
dist/

# Virtual environment (if you have one in the repo)
venv/
.venv/
env/

# Jupyter checkpoints
.ipynb_checkpoints/

# OS files
.DS_Store
EOF

cat > LICENSE <<EOF
MIT License

Copyright (c) 2026 sarch

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

cat > README.md <<EOF
# $input
EOF

cat > pyproject.toml <<EOF
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "$input"
version = "0.1.0"
dependencies = [
    "numpy",
    "sympy",
    "matplotlib",
]

[tool.setuptools]
packages = ["$input"]
EOF

pip install -e .