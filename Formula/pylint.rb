class Pylint < Formula
  include Language::Python::Virtualenv

  desc "It's not just a linter that annoys you!"
  homepage "https://github.com/PyCQA/pylint"
  url "https://files.pythonhosted.org/packages/3f/66/7ff186ccce07bf2277fcf5ea02485dc4023aefd82023f6d79f8f63376be5/pylint-2.14.0.tar.gz"
  sha256 "10d291ea5133645f73fc1b51ca137ad6531223c1461a5632a1db029a9bc033b5"
  license "GPL-2.0-or-later"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c77e8ce469f3d5ec03c548cecd07800cb40df7170b4321b105a54ffae0e1ee78"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6201188cde29e0b7f990b73d3473a3d3c6d236c610488d5edb3146c0a7607012"
    sha256 cellar: :any_skip_relocation, monterey:       "6e17353ca892d154ce17d6d2f037fe27a966775438b9133019813f52f9058a13"
    sha256 cellar: :any_skip_relocation, big_sur:        "64c2e30fbde412f75b63272fc9a8836136316f38b30842ad8f2e2131b960187b"
    sha256 cellar: :any_skip_relocation, catalina:       "7f3516b54c923777bdcf3155dee0562fc0bc8cd421b5eda1409c738a397e77d6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7a9b03b6395282eddd3290bc671b8a489eb810ee8c4897a29c51d2c45c07615a"
  end

  depends_on "python@3.10"

  resource "astroid" do
    url "https://files.pythonhosted.org/packages/e9/1f/0ac1e7c374a0347b119f67a752a7cf7c9a2c0b2fbea9da9797a825adf175/astroid-2.11.5.tar.gz"
    sha256 "f4e4ec5294c4b07ac38bab9ca5ddd3914d4bf46f9006eb5c0ae755755061044e"
  end

  resource "dill" do
    url "https://files.pythonhosted.org/packages/59/46/634d5316ee8984e7dac658fb2e297a19f50a1f4007b09acb9c7c4e15bd67/dill-0.3.5.1.tar.gz"
    sha256 "d75e41f3eff1eee599d738e76ba8f4ad98ea229db8b085318aa2b3333a208c86"
  end

  resource "isort" do
    url "https://files.pythonhosted.org/packages/ab/e9/964cb0b2eedd80c92f5172f1f8ae0443781a9d461c1372a3ce5762489593/isort-5.10.1.tar.gz"
    sha256 "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
  end

  resource "lazy-object-proxy" do
    url "https://files.pythonhosted.org/packages/75/93/3fc1cc28f71dd10b87a53b9d809602d7730e84cc4705a062def286232a9c/lazy-object-proxy-1.7.1.tar.gz"
    sha256 "d609c75b986def706743cdebe5e47553f4a5a1da9c5ff66d76013ef396b5a8a4"
  end

  resource "mccabe" do
    url "https://files.pythonhosted.org/packages/e7/ff/0ffefdcac38932a54d2b5eed4e0ba8a408f215002cd178ad1df0f2806ff8/mccabe-0.7.0.tar.gz"
    sha256 "348e0240c33b60bbdf4e523192ef919f28cb2c3d7d5c7794f74009290f236325"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/ff/7b/3613df51e6afbf2306fc2465671c03390229b55e3ef3ab9dd3f846a53be6/platformdirs-2.5.2.tar.gz"
    sha256 "58c8abb07dcb441e6ee4b11d8df0ac856038f944ab98b7be6b27b2a3c7feef19"
  end

  resource "tomli" do
    url "https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3/tomli-2.0.1.tar.gz"
    sha256 "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/24/24/e50be8344fc6e9c9ae55bfcb136b33ad562776d822736da3d1ec0278b18b/tomlkit-0.11.0.tar.gz"
    sha256 "71ceb10c0eefd8b8f11fe34e8a51ad07812cb1dc3de23247425fbc9ddc47b9dd"
  end

  resource "wrapt" do
    url "https://files.pythonhosted.org/packages/11/eb/e06e77394d6cf09977d92bff310cb0392930c08a338f99af6066a5a98f92/wrapt-1.14.1.tar.gz"
    sha256 "380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"pylint_test.py").write <<~EOS
      print('Test file'
      )
    EOS
    system bin/"pylint", "--exit-zero", "pylint_test.py"
  end
end
