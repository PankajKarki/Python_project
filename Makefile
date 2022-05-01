install:
	# install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	# format code
	black *.py mylib/*.py
lint:
	# flake8, pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	# test
	python -m pytest -vv --cov=mylib tests/test_logic.py
deploy:
	# deploy
all: install format lint test deploy
	# run all 