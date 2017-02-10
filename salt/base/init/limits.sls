/etc/security/limits.conf:
  file.append:
    - text:
      - "* 	- 		nofile		65535"
