TARGET_DIR := ./fabfile

lint:
	flake8 --ignore=F401,F403 $(TARGET_DIR)
	isort --check --diff $(TARGET_DIR)
	black --check $(TARGET_DIR)

format:
	isort $(TARGET_DIR)
	black $(TARGET_DIR)
