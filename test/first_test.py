import pytest

packages_testdata = [
    ('pandoc', "2.5-3"),
    ("jq", "1.6")
]
@pytest.mark.parametrize("os_package, expected", packages_testdata)
def test_os_packages(host, os_package, expected):
    actual = host.package(os_package)
    print(actual)
    assert actual.is_installed
    assert actual.version.startswith(expected)

def test_r_version(host):
    version = host.run("Rscript --version 2>&1").stdout
    print(version)
    assert "4.0.3" in version
