FROM        perl:latest
MAINTAINER  Dave Cross dave@perlhacks.org

RUN apt-get install openssl libssl-dev libz-dev libexpat1-dev
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN git clone http://github.com/davorg/succession.git
RUN cd succession && carton install --deployment

EXPOSE 8080

WORKDIR succession
CMD carton exec starman --port 8080 Succession/bin/app.psgi
