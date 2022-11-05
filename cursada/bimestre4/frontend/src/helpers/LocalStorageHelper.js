const LocalStorageHelper = {
    setItem: (KeyString, ItemObj) => {
        if (!KeyString || typeof KeyString !== 'string' || !ItemObj) return;
        localStorage.setItem(KeyString, ItemObj)
    },
    getItem: (StringKey) => {
        if (!StringKey || typeof StringKey !== 'string') return;
        return localStorage.getItem(StringKey) ?? null
    }
}

export default LocalStorageHelper;