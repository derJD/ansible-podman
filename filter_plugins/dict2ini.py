def dict2ini(data, quote=True):
    ret = []
    for section, subdict in data.items():
        for key, value in subdict.items():
            if isinstance(value, str) and quote:
                value = f'"{value}"'
            ret.append(dict(section=section, option=key, value=value))
    return ret


class FilterModule(object):
    ''' dict2ini filter '''

    def filters(self):
        return {
            'dict2ini': dict2ini
        }