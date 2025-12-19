#!/bin/bash
# Script to run safekeeper-related tests and capture results

echo "Running safekeeper-related tests with auth enabled by default..."
echo "Started at: $(date)" > safekeeper_test_results_fix.txt

# Core safekeeper test files
echo "=== Core Safekeeper Tests ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_safekeeper_migration.py -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_safekeeper_deletion.py -v >> safekeeper_test_results_fix.txt 2>&1

# Tests that configure multiple safekeepers or interact with safekeeper APIs
echo -e "\n=== Tests with Safekeeper Configuration ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_config.py::test_safekeepers_reconfigure_reorder -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_build_info_metric.py::test_build_info_metric -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_compute_reconfigure.py::test_compute_safekeeper_connstrings_duplicate -v >> safekeeper_test_results_fix.txt 2>&1

# Auth-related tests (already use safekeepers)
echo -e "\n=== Auth Tests (use safekeepers) ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_auth.py::test_compute_auth_to_pageserver -v >> safekeeper_test_results_fix.txt 2>&1

# WAL acceptor tests (many use safekeepers)
echo -e "\n=== WAL Acceptor Tests ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_wal_acceptor.py -v >> safekeeper_test_results_fix.txt 2>&1

# WAL acceptor async tests (also use safekeepers)
echo -e "\n=== WAL Acceptor Async Tests ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_wal_acceptor_async.py -v >> safekeeper_test_results_fix.txt 2>&1

# Compatibility tests that use safekeepers
echo -e "\n=== Compatibility Tests (with safekeepers) ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_compatibility.py -v >> safekeeper_test_results_fix.txt 2>&1

# Other tests that specifically configure multiple safekeepers
echo -e "\n=== Other Safekeeper-heavy Tests ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_logical_replication.py::test_wal_decode_as_plugin -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_logical_replication.py::test_wal_decode_as_extension -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_logical_replication.py::test_lr_with_slow_safekeeper -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_pageserver_catchup.py -v >> safekeeper_test_results_fix.txt 2>&1

# Specific safekeeper-named tests from other modules
echo -e "\n=== Specific Safekeeper Tests ===" >> safekeeper_test_results_fix.txt
./scripts/pytest test_runner/regress/test_ssl.py::test_safekeeper_https_api -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_wal_receiver.py::test_pageserver_lsn_wait_error_safekeeper_stop -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_storage_controller.py::test_safekeeper_deployment_time_update -v >> safekeeper_test_results_fix.txt 2>&1
./scripts/pytest test_runner/regress/test_storage_controller.py::test_safekeeper_activating_to_active -v >> safekeeper_test_results_fix.txt 2>&1

echo -e "\nCompleted at: $(date)" >> safekeeper_test_results_fix.txt
echo "Test results saved to safekeeper_test_results_fix.txt"
