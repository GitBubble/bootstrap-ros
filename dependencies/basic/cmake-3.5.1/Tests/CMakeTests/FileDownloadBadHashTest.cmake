set(url "file:///home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/CMakeTests/FileDownloadInput.png")
set(dir "/home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/CMakeTests/downloads")

file(DOWNLOAD
  ${url}
  ${dir}/file3.png
  TIMEOUT 2
  STATUS status
  EXPECTED_HASH SHA1=5555555555555555555555555555555555555555
  )
