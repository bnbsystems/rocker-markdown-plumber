import pytest
import subprocess
import os
import testinfra

@pytest.fixture(scope='session')
def host(request):
    id = subprocess.check_output(['docker', 'run', '-d', 'bnbsystems/rocker-markdown-plumber:dockerfile', 'sleep', 'infinity']).decode().strip()
    host = testinfra.get_host("docker://"+id)
    yield host
    subprocess.check_call(['docker', 'rm', '-f', id])