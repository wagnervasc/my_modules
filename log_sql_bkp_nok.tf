resource "google_logging_metric" "log_sql_bkp_nok" {
    name = "log_sql_bkp_nok"
    filter = "resource.type=cloudsql_database AND protoPayload.methodName=cloudsql.instances.automatedBackup AND protoPayload.status.message=OK"
    metric_descriptor {
        unit = "1"
        value_type = "INT64"
        metric_kind = "DELTA"
    }
}