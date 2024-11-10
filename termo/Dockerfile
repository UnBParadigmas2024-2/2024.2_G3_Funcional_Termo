FROM haskell:9.4.8

WORKDIR /app

COPY . .

COPY Words.txt /app/Words.txt

RUN cabal update

RUN cabal install --only-dependencies

RUN cabal build

CMD ["cabal", "run", "termo"]
