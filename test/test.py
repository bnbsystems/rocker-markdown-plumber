import pytest

packages_testdata = [
    ('pandoc', "0.0.0"),
    ("jq", "1.5")
]
@pytest.mark.parametrize("os_package, expected", packages_testdata)
def test_os_packages(host, os_package, expected):
    actual = host.package(os_package)
    assert actual.is_installed()
    assert actual.version.startswith(expected)

def test_r_version(host):
    version = host.command("Rscript --version")
    assert "4.0.3" in version
