#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=../shell_config.sh
. "$CUR_DIR"/../shell_config.sh

SCHEMADIR=$CURDIR/format_schemas
$CLICKHOUSE_LOCAL -q "DESCRIBE TABLE file('nonexist', 'Protobuf') SETTINGS format_schema='$SCHEMADIR/03094_recursive_type.proto:Struct'" |& grep -c CANNOT_PARSE_PROTOBUF_SCHEMA
