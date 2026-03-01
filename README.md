# Log Cleanup Automation (Bash Script) 🧹

A simple but practical **DevOps automation project** that cleans old log
files automatically using a Bash script.\
This project demonstrates **Linux administration, automation,
environment awareness, and safe production practices**.

---

## 📌 Why This Project Matters

In real production systems, applications continuously generate log
files.

If logs are **not cleaned regularly**:

- Disk space can fill up
- Applications may crash
- Servers may become unstable

DevOps engineers often automate log cleanup to keep systems healthy.

This project shows how to implement a **safe and environment-aware log
cleanup solution**.

---

## ⚙️ What This Script Does

The Bash script:

1.  Scans a log directory
2.  Finds old log files
3.  Deletes them automatically
4.  Works differently depending on the environment

Supported environments:

- **Development**
- **Production**

This demonstrates how DevOps engineers handle **different infrastructure
policies**.

---

## 🗂 Project Structure

    log-cleanup-bash/
    │
    ├── cleanup.sh
    ├── config.env
    └── README.md

---

## 📜 Script Example

```bash
#!/bin/bash

source config.env

echo "Running log cleanup for environment: $ENVIRONMENT"

if [ "$ENVIRONMENT" == "development" ]; then
    find $LOG_DIR -type f -name "*.log" -mtime +3 -delete
    echo "Development logs older than 3 days removed"

elif [ "$ENVIRONMENT" == "production" ]; then
    find $LOG_DIR -type f -name "*.log" -mtime +30 -delete
    echo "Production logs older than 30 days removed"

else
    echo "Unknown environment"
fi
```

---

## ⚙️ Environment Configuration

`config.env`

```bash
ENVIRONMENT=development
LOG_DIR=/var/log/myapp
```

This allows the **same script to behave differently depending on the
environment**.

---

## 🧪 Development Environment

In development:

- Logs are **not very critical**
- Engineers need to **free disk space quickly**
- Logs can be deleted sooner

Policy used:

    Delete logs older than 3 days

Command used:

    find /log/path -mtime +3

---

## 🏭 Production Environment

Production systems require **careful log management**.

Reasons:

- Logs are used for **debugging incidents**
- Logs may be required for **auditing**
- Logs help with **security investigations**

Policy used:

    Delete logs older than 30 days

This ensures enough historical data is preserved.

---

## ⏰ Automating with Cron

- `@yearly` (or `@annually`): Run once a year at midnight on January 1st (`0 0 1 1 *`).
- `@monthly`: Run once a month at midnight on the first day (`0 0 1 * *`).
- `@weekly`: Run once a week at midnight on Sunday (`0 0 * * 0`).
- `@daily` (or `@midnight`): Run once a day at midnight (`0 0 * * *`).
- `@hourly`: Run once an hour at the beginning of the hour (`0 * * * *`).
- `@reboot`: Run once after system startup.

`*` any value  
`,` value list separator  
`-` range of values  
`/` step values

In real systems, this script runs automatically.

Example cron job:

    0 2 * * * /path/to/cleanup.sh

Meaning:

- Runs every day
- At **2:00 AM**
- When system usage is low

---

## 🔒 Production Safety Practices

To avoid accidental deletion:

- Environment validation
- Config file separation
- Scheduled execution
- Limited file types (`*.log`)

These practices reflect **real-world DevOps operations**.

---

## 🚀 Skills Demonstrated

This project highlights practical DevOps skills:

- Linux administration
- Bash scripting
- Automation
- Log management
- Environment-based configuration
- Cron job scheduling

---

## 👨‍💻 Author

Built as part of **DevOps hands-on practice** to demonstrate automation
and system maintenance skills.
