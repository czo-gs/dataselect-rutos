# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0 (http://www.gnu.org/copyleft)
# File Created: 17 September 2025
# Last Modified: Monday 22 September 2025, 10:36
# Edit Time: 0:39:38
# Description:
#
#       OpenWRT Makefile for dataselect
#
# Copyright: (C) 2025 Olivier Sirol <czo@free.fr>

include $(TOPDIR)/rules.mk

PKG_NAME:=dataselect-rutx
PKG_VERSION:=4.1.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL_DS:=https://github.com/EarthScope/dataselect.git
PKG_SOURCE_VERSION_DS:=ca5baeddd009b02fc322cdaace7238f71059ccde
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Olivier SIROL <czo@ipgp.fr>

include $(INCLUDE_DIR)/package.mk

define Package/dataselect-rutx
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=dataselect - Selection and sorting for data in miniSEED format
	URL:=https://www.earthscope.org/
	DEPENDS:=+libcurl
endef

define Build/Prepare
	echo "#############################################  $(PKG_BUILD_DIR)"
	mkdir -p $(PKG_BUILD_DIR)
	cd $(PKG_BUILD_DIR) && git clone $(PKG_SOURCE_URL_DS) && cd dataselect && git checkout $(PKG_SOURCE_VERSION_DS)
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include
# TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib -lcurl

define Build/Compile
	@echo "#############################################  TARGET_CC: $(TARGET_CC)"
	@echo "#############################################  TARGET_CFLAGS: $(TARGET_CFLAGS)"
	@echo "#############################################  TARGET_LDFLAGS: $(TARGET_LDFLAGS)"
	$(MAKE) -C $(PKG_BUILD_DIR)/dataselect CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/dataselect-rutx/description
	This program is a general use tool for extracting a subset and sorting data in miniSEED format.
endef

define Package/dataselect-rutx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dataselect/dataselect $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dataselect-rutx))
