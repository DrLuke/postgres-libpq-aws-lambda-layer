# postgres-libpq-aws-lambda-layer

Layer for AWS Lambda that provides PostgreSQL's **libpq.so** for your runtime.

# Installation

To install this layer, you first have to compile PostgreSQL, then build the layer package and finally publish the layer to your AWS account.

#### Get source code
PostgreSQL is included as a submodule. Pull the version you want to add.
````bash
git submodule update --init --recursive
````

Then cd into `postgresql` and check out the version you want to use. You can find a list of tags [here](https://git.postgresql.org/gitweb/?p=postgresql.git;a=tags).

````bash
cd postgresql
git checkout tags/REL_11_2
````

#### Build PostgreSQL
Build according to [documentation](https://www.postgresql.org/docs/9.6/installation.html). If you have all prerequisites fulfilled, it should be as easy as running
````bash
./configure
make
make check
````

If everything compiled correctly, you get a message that all tests passed.

#### Build Layer
Run the build script in the project root.
````bash
./build_layer.sh
````

#### Publish layer to your account
To be able to use the layer you must publish it to your account. You don't need to provide a [compatible runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html), but without it the layer won't show up for selection in your lambda function. You can still add it with the ARN though.
````bash
aws lambda publish-layer-version \
  --layer-name postgres-libpq \
  --zip-file fileb://aws-libpg-layer.zip \
  --compatible-runtimes python3.7
````