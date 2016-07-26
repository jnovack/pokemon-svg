# pokemon-svg

A collection of Pokemon SVGs.  I claim no credit. I have merely assembled
(read: caught) them all in this repo.

# Docker

A `Dockerfile` and `Makefile` are included so that you can quickly and easily
export images.  Obviously, [Docker](https://www.docker.com/) is required and
and [Make](https://www.gnu.org/software/make/) is recommended.

The docker image finishes up at about `159.7 MB`, mostly because of
`phantomjs`.

## Export all images with Make

```
make
```

Yup, that simple. Runs:

* `build` - builds the docker container
* `docker` - preps the container for repeat access, mounts volumes, etc.
* `images` - processes all the images

## `Makefile` options

### Custom `/out` directory

After you have built the container, you can customize the `/out` directory
if you do not want all the PNGs to show up here.  Be sure the directory
exists first.

Use the `OUT=directory` argument to send the PNGs elsewhere.

#### Example: Output PNGs to the `/tmp` directory

```
make OUT=/tmp docker
make images
```

### Change the PNG export options

Same options as [shakiba/svgexport](https://github.com/shakiba/svgexport).

Use the `OPTS=options` argument to modify the PNGs prior to export.

#### Example: Resize all images to max 24px wide

```
make OPTS=24: images
```

#### Example: Resize all images to max 128px tall

```
make OPTS=:128 images
```

# Credit

* Twitter: [@eevee](https://twitter.com/eevee) 
* Original Website: http://veekun.com/dex/media/pokemon/dream-world/
* NodeJS Module: [shakiba/svgexport](https://github.com/shakiba/svgexport)
* Dockerized PhantomJS: [fgrehm/docker-phantomjs2](https://github.com/fgrehm/docker-phantomjs2)

# License
The source icons are (c) Nintendo/Creatures Inc./GAME FREAK Inc./The Pokémon
Company and used here under fair use in a non-commercial, open-source project.
