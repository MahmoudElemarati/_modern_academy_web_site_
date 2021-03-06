/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function changeIcon(id, combo_id) {
    var icon = document.getElementById(combo_id).value;
    document.getElementById(id).className = "icon " + icon;
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

var _page_name_G_;
var lang_G;
async function init(tabs_type, lang, _page_name_) {
    _page_name_G_ = _page_name_;
    lang_G = lang;
    get_main_tabs(tabs_type, lang, "table", "mainTabsTable");
    await sleep(100);

    get_main_tabs(tabs_type, lang, "combo", "mainTabId");
    await sleep(100);

    get_tabs(tabs_type, lang, "table", "TabsTable");
    await sleep(100);

    //
    if (_page_name_ === '_202_admin_site_pages') {
        get_sub_tabs(tabs_type, lang, "table", "subTabTable");
        await sleep(100);
    }

    get_pages_tree(tabs_type, lang);
}

function get_pages_tree(tabs_type, lang) {

    var URL = "_000_general_Ajax_001_get_pages_tree_AjaxServlet?"
            + "tabs_type=" + tabs_type
            + "&lang=" + lang;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById("myTree").innerHTML = message;
                RunTree();
            }
        }
    };

}

/**
 * Main Tab Functions
 */
function get_main_tabs(tabs_type, lang, combo_or_table, target_id) {

    var URL = "_000_general_Ajax_002_get_main_tabs_AjaxServlet?"
            + "tabs_type=" + tabs_type
            + "&combo_or_table=" + combo_or_table
            + "&lang=" + lang;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById(target_id).innerHTML = message;
                if (_page_name_G_ === "_202_admin_site_pages") {
                    document.getElementById("mainTabId-subTab").innerHTML = message;
                    document.getElementById("tabId-subTab").innerHTML = "";
                }
            }
        }
    };

}

function clear_main_tabs() {
    document.getElementById("mainTabNameA").value = "";
    document.getElementById("mainTabNameE").value = "";
    document.getElementById("link").value = "";
}
function add_main_tabs(tabs_type, lang) {

    var mainTabNameA = document.getElementById("mainTabNameA").value;
    var mainTabNameE = document.getElementById("mainTabNameE").value;
    var iconFaFa = document.getElementById("iconFaFa").value;
    var link = document.getElementById("link").value;

    if (mainTabNameE === "" || mainTabNameE === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة الرئيسية باللغة الإنجليزية");
        } else {
            Warning("please Insert Main Tab Name In English");
        }
    } else if (mainTabNameA === "" || mainTabNameA === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة الرئيسية باللغة العربية");
        } else {
            Warning("please Insert Main Tab Name In Arabic");
        }
    } else if (iconFaFa === "" || iconFaFa === null) {
        if (lang === "ar") {
            Warning("برجاء اختر الأيقونة");
        } else {
            Warning("please Choose Icon");
        }
    } else {
        var URL = "_000_general_Ajax_003_add_main_tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabNameA=" + mainTabNameA
                + "&mainTabNameE=" + mainTabNameE
                + "&iconFaFa=" + iconFaFa
                + "&link=" + link;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Error") {
                    if (lang === "ar") {
                        Error("حدث خطا");
                    } else {
                        Error("Error");
                    }
                } else {
                    if (lang === "ar") {
                        Success("تم حفظ البيانات");
                    } else {
                        Success("Data Saved");
                    }
                    init(tabs_type, lang, _page_name_G_);
                }
            }
        };
    }

}

var MainTabId_G;
function update_main_tabs(MainTabId, MainTabNameE, MainTabNameA, IconFaFa, Link, Index1, tabs_type, type, lang) {
    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
        document.getElementById("mainTabNameE-update").value = MainTabNameE;
        document.getElementById("mainTabNameA-update").value = MainTabNameA;

        document.getElementById("iconFaFa-update").value = IconFaFa;
        document.getElementById("updateForm-tab").className = "icon " + IconFaFa;

        document.getElementById("link-update").value = Link;
        document.getElementById("index-update").value = Index1;


    } else {
        //update Database
        var mainTabNameA = document.getElementById("mainTabNameA-update").value;
        var mainTabNameE = document.getElementById("mainTabNameE-update").value;
        var iconFaFa = document.getElementById("iconFaFa-update").value;
        var link = document.getElementById("link-update").value;
        var index = document.getElementById("index-update").value;

        if (mainTabNameE === "" || mainTabNameE === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة الرئيسية باللغة الإنجليزية");
            } else {
                Warning("please Insert Main Tab Name In English");
            }
        } else if (mainTabNameA === "" || mainTabNameA === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة الرئيسية باللغة العربية");
            } else {
                Warning("please Insert Main Tab Name In Arabic");
            }
        } else if (iconFaFa === "" || iconFaFa === null) {
            if (lang === "ar") {
                Warning("برجاء اختر الأيقونة");
            } else {
                Warning("please Choose Icon");
            }
        } else if (+index <= 0) {
            if (lang === "ar") {
                Warning("الترتيب لا بد ان يكون رقما أكبر من الصفر");
            } else {
                Warning("Indexing should be a number greater than zero");
            }
        } else {
            var URL = "_000_general_Ajax_004_update_main_tabs_AjaxServlet?"
                    + "tabs_type=" + tabs_type
                    + "&mainTabId=" + MainTabId_G
                    + "&mainTabNameA=" + mainTabNameA
                    + "&mainTabNameE=" + mainTabNameE
                    + "&iconFaFa=" + iconFaFa
                    + "&link=" + link
                    + "&index=" + index
                    + "&lang=" + lang;

            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var message = xhttp.responseText;
                    if (message === "Success") {
                        if (lang === "ar") {
                            Success("تم حفظ البيانات");
                        } else {
                            Success("Data Saved");
                        }
                        init(tabs_type, lang, _page_name_G_);
                        $('#mainTabsUpdateModal').modal('hide');
                    } else {
                        Error(message);
                    }
                }
            };
        }
    }
}

function delete_main_Tabs(MainTabId, tabs_type, type, lang) {

    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
    } else {
        //delete from Database

        var URL = "_000_general_Ajax_005_delete_main_Tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabId=" + MainTabId_G
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Success") {
                    if (lang === "ar") {
                        Success("تم حذف البيانات");
                    } else {
                        Success("Data Deleted");
                    }
                    init(tabs_type, lang, _page_name_G_);
                    $('#mainTabsDeleteModal').modal('hide');
                } else {
                    if (lang === "ar") {
                        Error("لا يمكن حذف هذا البيان لارتباطه ببيانات أخرى");
                    } else {
                        Error("can't delete this data because it is connected to other data");
                    }

                }
            }
        };
    }
}

/**
 * Tabs Functions
 */
function get_tabs(tabs_type, lang, combo_or_table, target_id) {

    var URL = "_000_general_Ajax_006_get_tabs_AjaxServlet?"
            + "tabs_type=" + tabs_type
            + "&combo_or_table=" + combo_or_table
            + "&lang=" + lang
            + "&_page_name_G_=" + _page_name_G_;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById(target_id).innerHTML = message;
            }
        }
    };

}

function clear_tabs() {
    document.getElementById("tabNameA").value = "";
    document.getElementById("tabNameE").value = "";
    document.getElementById("link-tab").value = "";
}
function add_tabs(tabs_type, lang) {

    var mainTabId = document.getElementById("mainTabId").value;
    var tabNameA = document.getElementById("tabNameA").value;
    var tabNameE = document.getElementById("tabNameE").value;
    var iconFaFa = document.getElementById("iconFaFa-2").value;
    var link = document.getElementById("link-tab").value;

    if (mainTabId === "" || mainTabId === null) {
        if (lang === "ar") {
            Warning("برجاء إختيار القائمة الرئيسية");
        } else {
            Warning("please choose Main Tab");
        }
    } else if (tabNameE === "" || tabNameE === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة باللغة الإنجليزية");
        } else {
            Warning("please Insert Tab Name In English");
        }
    } else if (tabNameA === "" || tabNameA === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة باللغة العربية");
        } else {
            Warning("please Insert Tab Name In Arabic");
        }
    } else if (iconFaFa === "" || iconFaFa === null) {
        if (lang === "ar") {
            Warning("برجاء اختر الأيقونة");
        } else {
            Warning("please Choose Icon");
        }
    } else {
        var URL = "_000_general_Ajax_007_add_tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabId=" + mainTabId
                + "&tabNameA=" + tabNameA
                + "&tabNameE=" + tabNameE
                + "&iconFaFa=" + iconFaFa
                + "&link=" + link
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Error") {
                    if (lang === "ar") {
                        Error("حدث خطا");
                    } else {
                        Error("Error");
                    }
                } else {
                    if (lang === "ar") {
                        Success("تم حفظ البيانات");
                    } else {
                        Success("Data Saved");
                    }
                    init(tabs_type, lang, _page_name_G_);
                }
            }
        };
    }

}

var TabId_G;
function update_tabs(TabId, MainTabId, TabNameE, TabNameA, IconFaFa, Link, Index1, TabLockedEnch, tabs_type, type, lang) {
    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
        TabId_G = TabId;
        document.getElementById("tabNameE-update").value = TabNameE;
        document.getElementById("tabNameA-update").value = TabNameA;

        document.getElementById("iconFaFa-2-update").value = IconFaFa;
        document.getElementById("addForm_tab_update").className = "icon " + IconFaFa;

        document.getElementById("link-tab-update").value = Link;
        document.getElementById("index-tab-update").value = Index1;
        document.getElementById("TabLockedEnch").value = TabLockedEnch;

        if (_page_name_G_ === "_202_admin_site_pages") {
            var data = lang.split("-");
            lang = data[0];
            var department_id = data[1];
            document.getElementById("department_id").value = department_id;
        }
    } else {
        //update Database
        var tabNameE = document.getElementById("tabNameE-update").value;
        var tabNameA = document.getElementById("tabNameA-update").value;
        var iconFaFa = document.getElementById("iconFaFa-2-update").value;
        var link = document.getElementById("link-tab-update").value;
        var index = document.getElementById("index-tab-update").value;
        var tabLockedEnch = document.getElementById("TabLockedEnch").value;

        if (tabNameE === "" || tabNameE === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة باللغة الإنجليزية");
            } else {
                Warning("please Insert Tab Name In English");
            }
        } else if (tabNameA === "" || tabNameA === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة باللغة العربية");
            } else {
                Warning("Please Insert Tab Name In Arabic");
            }
        } else if (iconFaFa === "" || iconFaFa === null) {
            if (lang === "ar") {
                Warning("برجاء اختر الأيقونة");
            } else {
                Warning("Please Choose Icon");
            }
        } else if (+index <= 0) {
            if (lang === "ar") {
                Warning("الترتيب لا بد ان يكون رقما أكبر من الصفر");
            } else {
                Warning("Indexing Should Be a Number Greater Than Zero");
            }
        } else if (tabLockedEnch === "" || tabLockedEnch === null) {
            if (lang === "ar") {
                Warning("اختر نوع دخول الشاشة");
            } else {
                Warning("Please Choose Screen Login Type");
            }
        } else {
            var URL = "_000_general_Ajax_008_update_tabs_AjaxServlet?"
                    + "tabs_type=" + tabs_type
                    + "&mainTabId=" + MainTabId_G
                    + "&tabId=" + TabId_G
                    + "&tabNameA=" + tabNameA
                    + "&tabNameE=" + tabNameE
                    + "&iconFaFa=" + iconFaFa
                    + "&link=" + link
                    + "&index=" + index
                    + "&TabLockedEnch=" + tabLockedEnch
                    + "&lang=" + lang;
            if (_page_name_G_ === "_202_admin_site_pages") {
                URL += "&department_id=" + document.getElementById("department_id").value;
            }
            URL += "&_page_name_G_=" + _page_name_G_;

            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var message = xhttp.responseText;
                    if (message === "Success") {
                        if (lang === "ar") {
                            Success("تم حفظ البيانات");
                        } else {
                            Success("Data Saved");
                        }
                        init(tabs_type, lang, _page_name_G_);
                        $('#TabsUpdateModal').modal('hide');
                    } else {
                        Error(message);
                    }
                }
            };
        }
    }
}

function delete_Tabs(TabId, MainTabId, tabs_type, type, lang) {

    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
        TabId_G = TabId;
    } else {
        //delete from Database

        var URL = "_000_general_Ajax_009_delete_Tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabId=" + MainTabId_G
                + "&tabId=" + TabId_G
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Success") {
                    if (lang === "ar") {
                        Success("تم حذف البيانات");
                    } else {
                        Success("Data Deleted");
                    }
                    init(tabs_type, lang, _page_name_G_);
                    $('#TabsDeleteModal').modal('hide');
                } else {
                    if (lang === "ar") {
                        Error("لا يمكن حذف هذا البيان لارتباطه ببيانات أخرى");
                    } else {
                        Error("can't delete this data because it is connected to other data");
                    }
                }
            }
        };
    }
}


function get_tabs_by_main_tab(tabs_type, lang, combo_or_table, target_id) {

    var main_tab_id = document.getElementById('mainTabId-subTab').value;
    var URL = "_000_general_Ajax_006_get_tabs_AjaxServlet?"
            + "tabs_type=" + tabs_type
            + "&combo_or_table=" + combo_or_table
            + "&main_tab_id=" + main_tab_id
            + "&lang=" + lang;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById(target_id).innerHTML = message;
            }
        }
    };

}


///////////////////////////////////// Sub Tab ////////////////////////////////////
///////////////////////////////////// Sub Tab ////////////////////////////////////
///////////////////////////////////// Sub Tab ////////////////////////////////////
///////////////////////////////////// Sub Tab ////////////////////////////////////
///////////////////////////////////// Sub Tab ////////////////////////////////////

function get_sub_tabs(tabs_type, lang, combo_or_table, target_id) {

    var URL = "_000_general_Ajax_010_get_sub_tabs_AjaxServlet?"
            + "tabs_type=" + tabs_type
            + "&combo_or_table=" + combo_or_table
            + "&lang=" + lang;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById(target_id).innerHTML = message;
            }
        }
    };

}

function clear_sub_tabs() {
    document.getElementById("tabId-subTab").innerHTML = "";
    document.getElementById("subTabNameE").value = "";
    document.getElementById("subTabNameA").value = "";
    document.getElementById("link-subTab").value = "";
}
function add_sub_tabs(tabs_type, lang) {

    var mainTabId = document.getElementById("mainTabId-subTab").value;
    var tabId = document.getElementById("tabId-subTab").value;
    var subTabNameE = document.getElementById("subTabNameE").value;
    var subTabNameA = document.getElementById("subTabNameA").value;
    var iconFaFa = document.getElementById("iconFaFa-2-subTab").value;
    var link = document.getElementById("link-subTab").value;

    if (mainTabId === "" || mainTabId === null) {
        if (lang === "ar") {
            Warning("برجاء إختيار القائمة الرئيسية");
        } else {
            Warning("please choose Main Tab");
        }
    } else if (tabId === "" || tabId === null) {
        if (lang === "ar") {
            Warning("برجاء إختيار القائمة");
        } else {
            Warning("please choose Tab");
        }
    } else if (subTabNameE === "" || subTabNameE === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة الفرعية باللغة الإنجليزية");
        } else {
            Warning("please Insert Sub Tab Name In English");
        }
    } else if (subTabNameA === "" || subTabNameA === null) {
        if (lang === "ar") {
            Warning("برجاء إدخال إسم القائمة الفرعية باللغة العربية");
        } else {
            Warning("please Insert Sub Tab Name In Arabic");
        }
    } else if (iconFaFa === "" || iconFaFa === null) {
        if (lang === "ar") {
            Warning("برجاء اختر الأيقونة");
        } else {
            Warning("please Choose Icon");
        }
    } else {
        var URL = "_000_general_Ajax_011_add_sub_tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabId=" + mainTabId
                + "&tabId=" + tabId
                + "&subTabNameA=" + subTabNameA
                + "&subTabNameE=" + subTabNameE
                + "&iconFaFa=" + iconFaFa
                + "&link=" + link
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Error") {
                    if (lang === "ar") {
                        Error("حدث خطا");
                    } else {
                        Error("Error");
                    }
                } else {
                    if (lang === "ar") {
                        Success("تم حفظ البيانات");
                    } else {
                        Success("Data Saved");
                    }
                    init(tabs_type, lang, _page_name_G_);
                }
            }
        };
    }

}

var SubTabId_G;
function update_sub_tabs(MainTabId, TabId, SubTabId, SubTabNameE, SubTabNameA, IconFaFa, Link, Index1, tabs_type, type, lang) {
    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
        TabId_G = TabId;
        SubTabId_G = SubTabId;
        document.getElementById("subTabNameE-update").value = SubTabNameE;
        document.getElementById("subTabNameA-update").value = SubTabNameA;

        document.getElementById("iconFaFa-2-subTab-update").value = IconFaFa;
        document.getElementById("addForm_subtab-update").className = "icon " + IconFaFa;

        document.getElementById("link-subTab-update").value = Link;
        document.getElementById("index-sub_tab-update").value = Index1;
    } else {
        //update Database
        var subTabNameE = document.getElementById("subTabNameE-update").value;
        var subTabNameA = document.getElementById("subTabNameA-update").value;
        var iconFaFa = document.getElementById("iconFaFa-2-subTab-update").value;
        var link = document.getElementById("link-subTab-update").value;
        var index = document.getElementById("index-sub_tab-update").value;

        if (subTabNameE === "" || subTabNameE === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة الفرعية باللغة الإنجليزية");
            } else {
                Warning("please Insert Sub Tab Name In English");
            }
        } else if (subTabNameA === "" || subTabNameA === null) {
            if (lang === "ar") {
                Warning("برجاء إدخال إسم القائمة الفرعية باللغة العربية");
            } else {
                Warning("Please Insert Sub Tab Name In Arabic");
            }
        } else if (iconFaFa === "" || iconFaFa === null) {
            if (lang === "ar") {
                Warning("برجاء اختر الأيقونة");
            } else {
                Warning("Please Choose Icon");
            }
        } else if (+index <= 0) {
            if (lang === "ar") {
                Warning("الترتيب لا بد ان يكون رقما أكبر من الصفر");
            } else {
                Warning("Indexing Should Be a Number Greater Than Zero");
            }
        } else {
            var URL = "_000_general_Ajax_012_update_sub_tabs_AjaxServlet?"
                    + "tabs_type=" + tabs_type
                    + "&mainTabId=" + MainTabId_G
                    + "&tabId=" + TabId_G
                    + "&subTabId=" + SubTabId_G
                    + "&subTabNameE=" + subTabNameE
                    + "&subTabNameA=" + subTabNameA
                    + "&iconFaFa=" + iconFaFa
                    + "&link=" + link
                    + "&index=" + index
                    + "&lang=" + lang;
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var message = xhttp.responseText;
                    if (message === "Success") {
                        if (lang === "ar") {
                            Success("تم حفظ البيانات");
                        } else {
                            Success("Data Saved");
                        }
                        init(tabs_type, lang, _page_name_G_);
                        $('#SubTabsUpdateModal').modal('hide');
                    } else {
                        Error(message);
                    }
                }
            };
        }
    }
}

function delete_sub_Tabs(MainTabId, TabId, SubTabId, tabs_type, type, lang) {

    if (type === 'fill-modal') {
        //filling modal in html
        MainTabId_G = MainTabId;
        TabId_G = TabId;
        SubTabId_G = SubTabId;
    } else {
        //delete from Database

        var URL = "_000_general_Ajax_013_delete_sub_Tabs_AjaxServlet?"
                + "tabs_type=" + tabs_type
                + "&mainTabId=" + MainTabId_G
                + "&tabId=" + TabId_G
                + "&subTabId=" + SubTabId_G
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Success") {
                    if (lang === "ar") {
                        Success("تم حذف البيانات");
                    } else {
                        Success("Data Deleted");
                    }
                    init(tabs_type, lang, _page_name_G_);
                    $('#SubTabsDeleteModal').modal('hide');
                } else {
                    if (lang === "ar") {
                        Error("لا يمكن حذف هذا البيان لارتباطه ببيانات أخرى");
                    } else {
                        Error("can't delete this data because it is connected to other data");
                    }
                }
            }
        };
    }
}

var title;
function Success(Body) {
    if (lang_G === "ar") {
        title = "تمت";
    } else {
        title = "Success";
    }
    new PNotify({
        title: title,
        text: Body,
        type: 'success',
        styling: 'bootstrap3'
    });
}
function Error(Body) {
    if (lang_G === "ar") {
        title = "خطأ";
    } else {
        title = "Error";
    }
    new PNotify({
        title: title,
        text: Body,
        type: 'error',
        styling: 'bootstrap3'
    });
}
function Warning(Body) {
    if (lang_G === "ar") {
        title = "تحذير";
    } else {
        title = "Warning";
    }
    new PNotify({
        title: title,
        text: Body,
        styling: 'bootstrap3'
    });
}