from celery import shared_task


@shared_task
def sharedtask():
    pass


@shared_task
def send_email():
    return f"Sending Email"


@shared_task
def send_sms():
    return f"Sending SMS message"
