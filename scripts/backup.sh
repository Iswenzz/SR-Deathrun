#!/bin/bash
source "$(dirname "$0")/.cod4env"

set -o pipefail
mkdir -p ~/backups
mysqldump -u root -p --single-transaction deathrun | gzip > ~/backups/deathrun_$(date +%Y%m%d_%H%M%S).sql.gz
