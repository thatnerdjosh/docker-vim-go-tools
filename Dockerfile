FROM golang:latest

MAINTAINER Josh Santos <josh@omnidapps.com>

ENV GOPATH /home/developer/workspace
ENV GOROOT /usr/local/go
ENV GOBIN $GOROOT/bin
ENV PATH $PATH:$GOBIN:$GOPATH/bin

RUN mkdir -p /home/developer/workspace/bin                  && \
    GO111MODULE=on go get -buildmode=exe -ldflags '-s -w'      \
      golang.org/x/lint/golint                                 \
      golang.org/x/tools/cmd/benchcmp                          \
      golang.org/x/tools/cmd/bundle                            \
      golang.org/x/tools/cmd/callgraph                         \
      golang.org/x/tools/cmd/cover                             \
      golang.org/x/tools/cmd/digraph                           \
      golang.org/x/tools/cmd/eg                                \
      golang.org/x/tools/cmd/fiximports                        \
      golang.org/x/tools/cmd/godex                             \
      golang.org/x/tools/cmd/godoc                             \
      golang.org/x/tools/cmd/goimports                         \
      golang.org/x/tools/cmd/gomvpkg                           \
      golang.org/x/tools/cmd/gorename                          \
      golang.org/x/tools/cmd/gotype                            \
      golang.org/x/tools/cmd/html2article                      \
      golang.org/x/tools/cmd/guru                              \
      golang.org/x/tools/cmd/present                           \
      golang.org/x/tools/cmd/ssadump                           \
      golang.org/x/tools/cmd/stress                            \
      golang.org/x/tools/cmd/stringer                          \
      golang.org/x/tools/refactor/eg                           \
      golang.org/x/tools/refactor/importgraph                  \
      golang.org/x/tools/refactor/rename                       \
      golang.org/x/tools/refactor/satisfy                      \
      golang.org/x/tools/gopls@latest                          \
      github.com/rogpeppe/godef                                \
      github.com/tools/godep                                   \
      github.com/nsf/gocode                                    \
      github.com/kisielk/errcheck                              \
      github.com/jstemmer/gotags                               \
      github.com/dougm/goflymake                               \
      github.com/golang/mock/mockgen                        && \
    find / -name ".git" -prune -exec rm -rf "{}" \;

WORKDIR /home/developer/workspace/
