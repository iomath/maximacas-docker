FROM debian:jessie

RUN apt-get -qq update
RUN apt-get -qq install -y git \
	sbcl \
	autoconf automake make texinfo \
	python3 \
	rlwrap \
	gnuplot
RUN git clone https://git.code.sf.net/p/maxima/code maxima-code

WORKDIR maxima-code
RUN git checkout 5.42.0
RUN sh bootstrap
RUN ./configure --with-sbcl --enable-quiet-build
RUN make
RUN make check || cat tests/test-suite.log
RUN make install

COPY maxima-config /root/.maxima

ENTRYPOINT ["maxima"]
CMD ["--quiet"]

