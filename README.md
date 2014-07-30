## Introduction

Elasticsearch-analysis-arirang is an elasticsearch plugin providing Korean morpheme analysis for Elasticsearch

## Dependencies

This plugin is based on arirang analysis library for Lucene. Visit the [project home page][1] for more information about the analysis library.

[1]: http://cafe.naver.com/korlucene.cafe

## Installation

1. Build the plugin binary with `mvn assembly:assembly`
2. The plugin binary is generated as `target/elasticsearch-analysis-arirang-1.0.0-jar-with-dependencies.jar`
3. Generate the plugin directory: `$ES_HOME/plugins/analysis-arirang`
4. Copy the plugin binary to the new directory
5. Restart elasticsearch

## Usage

See [demo.sh][2] for the usage of the analysis plugin

[2]: https://github.com/kimhyunkang/elasticsearch-analysis-arirang/blob/master/demo.sh
