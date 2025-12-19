#!/bin/bash
# Script to run pageserver-related tests and capture results

echo "Running pageserver-related tests with auth enabled by default..."
echo "Started at: $(date)" > pageserver_test_results_with_auth_4.txt

# Core pageserver test files
# echo "=== Core Pageserver Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/regress/test_pageserver_api.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_config.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_restart.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_reconnect.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_restarts_under_workload.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_crash_consistency.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_generations.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_secondary.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_catchup.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_change_pageserver.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_close_fds.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_recovery.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Pageserver performance and behavior tests
# echo -e "\n=== Pageserver Performance & Behavior Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/regress/test_pageserver_layer_rolling.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_getpage_throttle.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_pageserver_metric_collection.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_disk_usage_eviction.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Tests that heavily interact with pageserver HTTP APIs
# echo -e "\n=== Pageserver API Integration Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/regress/test_branch_behind.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_layer_writers_fail.py -v >> pageserver_test_results_with_auth.txt 2>&1  # -- INTENSIONALLY SKIPPED
# ./scripts/pytest test_runner/regress/test_ondemand_slru_download.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_bad_connection.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Tenant and timeline management tests (pageserver core functionality)
# echo -e "\n=== Tenant & Timeline Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/regress/test_tenant_conf.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_tenant_detach.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_tenant_delete.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_timeline_delete.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_timeline_size.py -v >> pageserver_test_results_with_auth.txt 2>&1
# NEED TO RESUME TESTS FROM HERE
./scripts/pytest test_runner/regress/test_timeline_detach_ancestor.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_relations.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_tenants.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_tenant_size_limit.py -v >> pageserver_test_results_with_auth_4.txt 2>&1 # This was named wrong

# # Compaction and GC tests (pageserver background processes)
# echo -e "\n=== Compaction & GC Tests ===" >> pageserver_test_results_with_auth_3.txt
# ./scripts/pytest test_runner/regress/test_compaction.py -v >> pageserver_test_results_with_auth_3.txt 2>&1
# ./scripts/pytest test_runner/regress/test_gc.py -v >> pageserver_test_results_with_auth_3.txt 2>&1
# ./scripts/pytest test_runner/regress/test_gc_aggressive.py -v >> pageserver_test_results_with_auth_3.txt 2>&1

# # Remote storage tests (pageserver backup functionality)  
# echo -e "\n=== Remote Storage Tests ===" >> pageserver_test_results_with_auth_3.txt
# ./scripts/pytest test_runner/regress/test_remote_storage.py -v >> pageserver_test_results_with_auth_3.txt 2>&1
# ./scripts/pytest test_runner/regress/test_backup_restore.py -v >> pageserver_test_results_with_auth_3.txt 2>&1
# ./scripts/pytest test_runner/regress/test_import_pgdata.py -v >> pageserver_test_results_with_auth_3.txt 2>&1
# ./scripts/pytest test_runner/regress/test_import.py -v >> pageserver_test_results_with_auth.txt 2>&1

# WAL receiver tests (pageserver <-> safekeeper communication)
echo -e "\n=== WAL Receiver Tests ===" >> pageserver_test_results_with_auth_4.txt
./scripts/pytest test_runner/regress/test_wal_receiver.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_wal_streaming.py -v >> pageserver_test_results_with_auth_4.txt 2>&1

# LSN mapping and timeline features (pageserver core)
echo -e "\n=== LSN Mapping & Timeline Features ===" >> pageserver_test_results_with_auth_4.txt
./scripts/pytest test_runner/regress/test_lsn_mapping.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_ancestor_branch.py -v >> pageserver_test_results_with_auth_4.txt 2>&1

# Auth tests that specifically test pageserver auth
echo -e "\n=== Pageserver Auth Tests ===" >> pageserver_test_results_with_auth_4.txt
./scripts/pytest test_runner/regress/test_auth.py -v >> pageserver_test_results_with_auth_4.txt 2>&1
./scripts/pytest test_runner/regress/test_ssl.py -v >> pageserver_test_results_with_auth_4.txt 2>&1

# # Sharding tests (multi-pageserver functionality)
# echo -e "\n=== Pageserver Sharding Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/regress/test_sharding.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/regress/test_storage_scrubber.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Performance tests that specifically test pageserver
# echo -e "\n=== Pageserver Performance Tests ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/performance/pageserver/pagebench/test_pageserver_max_throughput_getpage_at_latest_lsn.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/pageserver/test_page_service_batching.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Other performance tests that interact with pageserver HTTP APIs or metrics
# echo -e "\n=== Performance Tests with Pageserver Interaction ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/performance/test_gc_feedback.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/test_sharded_ingest.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/test_perf_many_relations.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/test_storage_controller_scale.py -v >> pageserver_test_results_with_auth.txt 2>&1

# # Performance tests that measure pageserver writes/behavior
# echo -e "\n=== Performance Tests Measuring Pageserver Behavior ===" >> pageserver_test_results_with_auth.txt
# ./scripts/pytest test_runner/performance/test_write_amplification.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/test_gist_build.py -v >> pageserver_test_results_with_auth.txt 2>&1
# ./scripts/pytest test_runner/performance/test_parallel_copy_to.py -v >> pageserver_test_results_with_auth.txt 2>&1

echo -e "\nCompleted at: $(date)" >> pageserver_test_results_with_auth_4.txt
echo "Test results saved to pageserver_test_results_with_auth_4.txt"
