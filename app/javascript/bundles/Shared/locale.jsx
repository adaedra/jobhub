import React from 'react'
import { addLocaleData, IntlProvider } from 'react-intl'
import en from 'react-intl/locale-data/en'
import fr from 'react-intl/locale-data/fr'
import de from 'react-intl/locale-data/de'
import { translations } from 'locales/translations'
import { defaultLocale } from 'locales/default'

if (typeof Intl === typeof undefined) { require('intl') }

addLocaleData([...en, ...fr, ...de])

export const withLocale = (lang, Element) => (
  <IntlProvider locale={lang || defaultLocale} messages={translations[lang]}>
    <Element />
  </IntlProvider>
)
