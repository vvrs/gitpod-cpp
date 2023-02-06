from conans import ConanFile, CMake

class GitpodCppConan(ConanFile):
    name = "GitpodCpp"
    version = "1.0.0"
    description = "Cpp project template for using gitpod with Ubuntu 22.04"
    license = "MIT"
    url = "https://github.com/vvrs/gitpod-cpp"

    requires = "fmt/7.0.3"

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        self.copy("*.h", dst="include", src="fmt/include")
        self.copy("*.lib", dst="lib", src="lib")
        self.copy("*.dll", dst="bin", src="bin")
        self.copy("*.so", dst="lib", src="lib")
        self.copy("*.dylib", dst="lib", src="lib")
        self.copy("*.a", dst="lib", src="lib")

    def package_info(self):
        self.cpp_info.libs = ["fmt"]
