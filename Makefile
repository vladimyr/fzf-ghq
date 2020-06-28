lint:
	@shellcheck -s bash *.zsh

fmt: format
format:
	@shfmt -ln=bash -i 2 -s -w *.zsh

.PHONY: lint format
