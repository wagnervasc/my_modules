resource "google_monitoring_alert_policy" "alert_sql_bkp_nok" {
    display_name = "Backup Cloud SQL fail"
    combiner = "OR"
    conditions {
        display_name = "Number backup fail"
        condition_threshold {
            filter = "resource.type = \"cloudsql_database\" AND metric.type = \"logging.googleapis.com/user/${google_logging_metric.log_sql_bkp_nok.id}\""
            duration = "86400s"
            comparison = "COMPARISON_GT"
            threshold_value = var.threshold
            trigger {
                count = var.threshold
            }
        }
    }
    alert_strategy {
        auto_close = "604800s"
    }
    notification_channels = var.notification_channel
}
