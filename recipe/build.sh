#!/bin/env bash

cd scream/components/eamxx/src/python
# download this file because otherwise the build will fail...
wget https://web.lcrc.anl.gov/public/e3sm/inputdata/atm/scream/tables/p3_lookup_table_2.dat-v4.1.1
wget https://web.lcrc.anl.gov/public/e3sm/inputdata/atm/scream/tables/p3_lookup_table_1.dat-v4.1.1
mkdir -p build_src/atm/scream/tables
mv p3_lookup_table_1.dat-v4.1.1 build_src/atm/scream/tables/
mv p3_lookup_table_2.dat-v4.1.1 build_src/atm/scream/tables/

cmake -Wno-dev \
    -S ../../ \
    -B build_src \
    -DCMAKE_BUILD_TYPE='Release' \
    -DEAMXX_ENABLE_PYBIND='ON' \
    -DSCREAM_DOUBLE_PRECISION='OFF' \
    -DNetcdf_Fortran_PATH=$PREFIX \
    -DNetcdf_C_PATH=$PREFIX \
    -DCMAKE_CXX_FLAGS='-fvisibility-inlines-hidden -fmessage-length=0 -Wno-use-after-free -Wno-unused-variable -Wno-maybe-uninitialized' \
    -DCMAKE_C_FLAGS='' \
    -DCMAKE_Fortran_FLAGS='-Wno-maybe-uninitialized -Wno-unused-dummy-argument' \
    -DCMAKE_CXX_COMPILER=mpic++ \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_Fortran_COMPILER=mpif90 \
    -DBUILD_SHARED_LIBS='ON' \
    -DSCREAM_INPUT_ROOT="build_src" \
    -DSCREAM_ENABLE_BASELINE_TESTS='OFF' \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DPYTHON_EXECUTABLE=$PYTHON

cmake --build build_src/src/python -j${CPU_COUNT:-128}

find build_src -name "*.so*" | xargs cp -t libpyeamxx/

for f in libpyeamxx/*.so*; do patchelf --set-rpath '$ORIGIN' --force-rpath $f; done

$PYTHON -m build -w -n -x

pushd $SP_DIR
unzip $SRC_DIR/scream/components/eamxx/src/python/dist/*.whl
popd
