resource "google_monitoring_alert_policy" "alert_sql_bkp_nok" {
    display_name = "Backup Cloud SQL fail"
    combiner = "OR"
    conditions {
        display_name = "Number backup fail"
        condition_threshold {
            filter = "resource.type = \"cloudsql_database\" AND metric.type = \"logging.googleapis.com/user/cloudsql_backup_auto_ok\""
            duration = "86400s"
            comparison = "COMPARISON_GT"
            threshold_value = 1
        }
    }
}
