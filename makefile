# Trick to publish subfolder: https://gist.github.com/cobyism/4730490

.PHONY: all deploy clean

all: build

dist:
	git worktree add dist gh-pages

build:
	npm run build

deploy: build
	cd dist && \
	git add --all && \
	git commit -m "Deploy to gh-pages" && \
	git push origin gh-pages

# Removing the actual dist directory confuses git and will require a git worktree prune to fix
clean:
	rm -rf dist/*
