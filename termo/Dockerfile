FROM haskell:9.4.8

WORKDIR /app

COPY . .

RUN cabal install --only-dependencies

RUN cabal build

CMD ["cabal", "run", "termo"]
