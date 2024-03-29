set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO jemalloc/jemalloc
	REF 886e40bb339ec1358a5ff2a52fdb782ca66461cb
	SHA512 0ae96cf0f00eea0de2d2484bdcbd86be22197f36a7cd806e2cc869c2b944d07e0dbe4ffb68be50c1c5ab50dcf3f56339445fc126831b96b2f0ca0a7eda1a8465
	HEAD_REF dev
)

vcpkg_execute_required_process(COMMAND bash -c "./autogen.sh --prefix=${SOURCE_PATH}" WORKING_DIRECTORY "${SOURCE_PATH}" LOGNAME "gen_")

vcpkg_configure_make(
	SOURCE_PATH ${SOURCE_PATH}
	)
vcpkg_build_make(BUILD_TARGET "install")
vcpkg_build_make(BUILD_TARGET "")

vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/COPYING"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright
    )
