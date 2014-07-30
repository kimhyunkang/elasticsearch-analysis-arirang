#!/bin/sh

curl -XDELETE 'http://localhost:9200/test_index_ko' && echo

curl -XPUT 'http://localhost:9200/test_index_ko' -d '{
    "settings": {
        "analysis": {
            "analyzer": {
                "ko_analyzer": {
                    "type": "custom",
                    "filter": ["lowercase", "arirang_filter"],
                    "tokenizer": "arirang_tokenizer",
                    "analyzer": "arirang_analyzer"
                }
            }
        }
    }
}' && echo

curl -XPUT 'http://localhost:9200/test_index_ko/analyzer/_mapping' -d '{
    "analyzer": {
        "_all": {"analyzer": "ko_analyzer"},
        "properties": {
            "body": {
                "type": "string"
            }
        }
    }
}' && echo

curl -XPUT 'http://localhost:9200/test_index_ko/analyzer/1' -d '{"body": "Elasticsearch에 입력해보는 시험 데이터입니다."}' && echo
curl -XPUT 'http://localhost:9200/test_index_ko/analyzer/2' -d '{"body": "카카오톡을 보내 보겠습니다"}' && echo
curl -XPOST 'http://localhost:9200/test_index_ko/_refresh' && echo

curl -s 'http://localhost:9200/test_index_ko/analyzer/_search?pretty=true' -d '{"query": {"query_string": {"query": "elasticsearch"}}}'
curl -s 'http://localhost:9200/test_index_ko/analyzer/_search?pretty=true' -d '{"query": {"query_string": {"query": "입력"}}}'
curl -s 'http://localhost:9200/test_index_ko/analyzer/_search?pretty=true' -d '{"query": {"query_string": {"query": "시험"}}}'
curl -s 'http://localhost:9200/test_index_ko/analyzer/_search?pretty=true' -d '{"query": {"query_string": {"query": "카카오톡"}}}'
