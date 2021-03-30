import pytest

def test_os_user(host):
    hosts = host.file("/etc/hosts")
    print(hosts)
    assert hosts.user == "root"
    
def test_env_var(host):
    echo = host.run("printenv BUILD_API_KEY")
    print(echo)
    assert echo.exit_status == 0
    assert echo.stdout.strip() == "1234"