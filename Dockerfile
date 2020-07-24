FROM minidocks/python

ENV PYTHONUNBUFFERED 1

ARG version=51

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f \
    && pip install weasyprint==$version \
    && clean

RUN mkdir -p /code
WORKDIR /code
COPY . /code/