FROM golang:1.18-alpine3.16 as builder

WORKDIR /src/app/hello

RUN go mod init example/hello && \
    printf 'package main\nimport "fmt"\nfunc main() {\n    fmt.Println("Code.education Rocks!")\n}' > hello.go && \
    go build

FROM scratch

COPY --from=builder /src/app/hello/hello .

CMD [ "./hello" ]