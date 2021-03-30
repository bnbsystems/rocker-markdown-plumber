import pytest
import subprocess
import os
import testinfra

@pytest.fixture(scope='session')
def host(request):
    id = subprocess.check_output(['docker', 'run', '-d', '-e', 'BUILD_API_KEY=1234', 'bnbsystems/rocker-markdown-plumber:dockerfile']).decode().strip()
    host = testinfra.get_host("docker://"+id)
    yield host
    subprocess.check_call(['docker', 'rm', '-f', id])