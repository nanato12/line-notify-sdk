.PHONY: init
init:
	pip install --upgrade pip
	pip install -r requirements.txt
	pip install -r requirements-dev.txt

.PHONY: lint
lint:
	rm -rf .mypy_cache
	black .
	flake8 .
	isort .
	mypy .

.PHONY: build
build:
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	python setup.py sdist
	python setup.py bdist_wheel

.PHONY: test-pypi
test-pypi:
	twine upload --repository pypitest dist/* --verbose

.PHONY: pypi
pypi:
	twine upload --repository pypi dist/* --verbose
