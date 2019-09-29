ARCHS=(arm s390x amd64 ppc64le)
QEMUARCHS=(arm s390x x86_64 ppc64le)
QEMUVER="v2.12.0-1"

get_qemu() {
    if [[ ! $(find . -name "*qemu-*") ]]; then
        echo "Downloading Qemu "
        for target_arch in ${QEMUARCHS[*]}; do
            if ! curl -OLs "https://github.com/multiarch/qemu-user-static/releases/download/$QEMUVER/x86_64_qemu-${target_arch}-static.tar.gz"; then
                echo "Error downloading Qemu"
                exit
            fi
            tar -xvf x86_64_qemu-"${target_arch}"-static.tar.gz
        done
        rm -f x86_64_qemu-*
    fi
}

get_qemu
