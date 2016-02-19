schedule:
  job1:
    function: cmd.run
    seconds: 30
    return_job: True
    maxrunning: 1
    jid_include: True
    args:
      - 'sleep 60'
