set shell := ["fish", "-c"]

# format by ruff
fmt:
	ruff format .

# lint by ruff
lint:
	ruff check --fix .

# check types by mypy
type-check:
	mypy .

# run pytest in tests directory
test:
	pytest

# run fmt lint type-check test
all: fmt lint type-check test

# start up all the services in detached mode
compose-up:
	set -gx UID (id -u); set -gx GID (id -g); docker compose up -d

# compose down
compose-down:
	docker compose down

# lint Dockerfile by hadolint
hadolint:
	hadolint Dockerfile
