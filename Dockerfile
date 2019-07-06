FROM nnurphy/deb

ENV PATH=/root/.cabal/bin:$PATH

RUN set -ex \
  ; apt-get update \
  ; apt-get install -y --no-install-recommends \
        cabal-install \
        zlibc zlib1g-dev \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; cabal update \
  ; cabal install idris \
  ; rm -rf /root/.cabal/packages/*
