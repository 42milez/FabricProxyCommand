TARGET_DIR := ./fabfile

format:
	isort $(TARGET_DIR)
	black $(TARGET_DIR)

lint:
	isort --check --diff $(TARGET_DIR)
	black --check $(TARGET_DIR)
	flake8 --ignore=F401,F403 $(TARGET_DIR)
