install:
	# install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	# format code
	black *.py mylib/*.py tests/*.py
lint:
	# flake8, pylint
	pylint --disable=R,C *.py mylib/*.py tests/*.py
test:
	# test
	python -m pytest -vv --cov=tests tests/
build:
	# deploy
	docker build -t deploy-fastapi .
run:
	# run
	#docker run -p 8000:8000 deploy-fastapi
deploy:
	# deploy
all: install format lint test deploy
	# run all 