## Backup to S3

Schedule the script in crontab to periodically sync *myfolder*:

`
backup.sh /path/to/myfolder
`

What the script does:

`
aws s3 sync myfolder s3://ccfun-backup/myfolder --storage-class STANDARD_IA
`

The script uses `aws s3 sync` to upload changed content in the source folder to the backup bucket under the same folder name.

Files are sent to S3 in the **STANDARD_IA** storage class, this is ideal for long-lived and infrequently accessed data like backups. The bucket lifecycle is set to move 30 days old files to **Glacier** to save cost of storage.

Resources:

https://aws.amazon.com/s3/storage-classes/

https://pawelgrzybek.com/my-amazon-s3-photo-backup-solution/
