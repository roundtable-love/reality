# REALITY: Language Register 1.0

```text
Status: DRAFT
UID: REALITY-LANGUAGES-1.0
Base: REALITY
```

## 1. Coverage Model

The goal of REALITY is universal human access. The ceiling is not ambition — it
is model fidelity. AI-generated transpilation degrades for under-resourced
languages to the point of parity violation, which the spec explicitly prohibits.
A bad translation is worse than no translation.

| Tier | Name | Selection Logic (Model Support) | Coverage | Status |
| :--- | :--- | :--- | :--- | :--- |
| **1** | **ROOT** | Full Reasoning, Tool Use, & Code Execution | ~78% | **Current** |
| **2** | **High-Res** | Reliable Prompting & Logical Consistency | ~12% | **Current** |
| **3** | **Perimeter** | Translation-Only / Semantic Comprehension | ~5% | **Current** |
| **Community** | **Open** | No Native Model Reasoning Depth | Remainder | Open |

## 2. Fidelity Constraints (Normative)

Transpilation MUST satisfy all strictness constraints defined in
[MACHINE-1.0 §2](https://github.com/roundtable-love/machine/blob/master/machine.md#2-strictness-constraints-normative)
and
[MACHINE-1.0 §7](https://github.com/roundtable-love/machine/blob/master/machine.md#7-rules-normative).

A transpilation output MUST additionally be rejected if it fails a
native-speaker parity check or a model-based semantic similarity audit ($S <
0.88$).

## 3. Tier 1: ROOT

*Nodes capable of native logic execution and instruction following without
internal pivot-language translation.*

| Language | ISO Code |
| :--- | :--- |
| العربية الفصحى (Arabic, Modern Standard) | `ar` |
| مصري (Arabic, Egyptian) | `arz` |
| বাংলা (Bengali) | `bn` |
| 廣東話 (Chinese, Cantonese) | `yue` |
| 中文 (Chinese, Mandarin) | `zh` |
| English | `en` |
| فارسی (Farsi/Persian) | `fa` |
| Français (French) | `fr` |
| Deutsch (German) | `de` |
| ગુજરાતી (Gujarati) | `gu` |
| עברית (Hebrew) | `he` |
| हिन्दी (Hindi) | `hi` |
| Bahasa Indonesia (Indonesian) | `id` |
| Italiano (Italian) | `it` |
| 日本語 (Japanese) | `ja` |
| ಕನ್ನಡ (Kannada) | `kn` |
| 한국어 (Korean) | `ko` |
| മലയാളം (Malayalam) | `ml` |
| मराठी (Marathi) | `mar` |
| Polski (Polish) | `pl` |
| Português (Portuguese) | `pt` |
| Română (Romanian) | `ro` |
| Русский (Russian) | `ru` |
| Español (Spanish) | `es` |
| தமிழ் (Tamil) | `ta` |
| తెలుగు (Telugu) | `te` |
| ภาษาไทย (Thai) | `th` |
| Türkçe (Turkish) | `tr` |
| Українська (Ukrainian) | `uk` |
| اردو (Urdu) | `ur` |
| Tiếng Việt (Vietnamese) | `vi` |

## 4. Tier 2: High-Res

*Nodes verified for reliable prompting and structural stability.*

| Language | ISO Code |
| :--- | :--- |
| 吴语 (Chinese, Wu) | `wuu` |
| Čeština (Czech) | `cs` |
| Ελληνικά (Greek) | `el` |
| هَوُسَ (Hausa) | `ha` |
| Magyar (Hungarian) | `hu` |
| Igbo | `ig` |
| Basa Jawa (Javanese) | `jv` |
| Naijá (Nigerian Pidgin) | `pcm` |
| پنجابی (Punjabi, Western) | `pnb` |
| Kiswahili (Swahili) | `sw` |
| Tagalog | `tl` |
| Yorùbá (Yoruba) | `yo` |

## 5. Tier 3: Perimeter

*Nodes functional for translation but prone to logic leaks; requires strict
grounding.*

| Language | ISO Code |
| :--- | :--- |
| አማርኛ (Amharic) | `am` |
| عربي سوداني (Arabic, Sudanese) | `apd` |
| Azərbaycan (Azerbaijani) | `az` |
| भोजपुरी (Bhojpuri) | `bho` |
| မြန်မာ (Burmese) | `my` |
| 客家話 (Chinese, Hakka) | `hak` |
| 晉語 (Chinese, Jin) | `cjy` |
| 閩南語 (Chinese, Min Nan) | `nan` |
| Fulfulde (Fula) | `ff` |
| Patwa (Jamaican Patois) | `jam` |
| ភាសាខ្មែر (Khmer) | `km` |
| Ikinyarwanda (Kinyarwanda) | `rw` |
| मगही (Magahi) | `mag` |
| मैथिली (Maithili) | `mai` |
| ଓଡ଼ିଆ (Oriya) | `or` |
| Oromoo (Oromo) | `om` |
| پښتو (Pashto) | `ps` |
| Runasimi (Quechua) | `qu` |
| سنڌي (Sindhi) | `sd` |
| Soomaali (Somali) | `so` |
| Basa Sunda (Sundanese) | `su` |
| Oʻzbek (Uzbek) | `uz` |
| isiZulu (Zulu) | `zu` |

## 6. Rules (Normative)

1. Languages MUST be sorted alphabetically by their English name within each
   Tier section.
1. ISO 639-1 codes MUST be used where they exist. ISO 639-3 MAY be used for
   languages without a 639-1 code.
1. New languages MUST be added in alphabetical order by English name to the
   appropriate Tier.
1. `bin/transpile` MUST derive its supported language list from these tables.

______________________________________________________________________

```text
Language Code: 639-1:en
Regional Variant: 3166-2:GB
Timestamp Standard: 8601
Protocol Class: MACHINE-1.0
```
