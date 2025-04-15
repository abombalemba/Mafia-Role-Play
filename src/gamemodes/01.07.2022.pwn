// includes
#tryinclude <abc>
#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <dc_cmd>
#include <a_actor>
//#include <mxINI>
//#include <string>
#include <streamer>
#include <foreach>
#include <forveh>
//#include <audio>

// constants
#define SQL_HOST                                                                "localhost"
#define SQL_USER                                                                "root"
#define SQL_DB                                                                  "bad mafia rp"
#define SQL_PASS                                                                ""

// info sevrver
#define SERVER_NAME 															"Mafia Role Play"
#define SERVER_VERSION 															"Role Play"
#define SERVER_MAP            										            "San Andreas"
#define SERVER_WEBSITE 															"mafia-rp.su"
#define SERVER_WEBSITE_DONATE       									        "mafia-rp.su/donate"
#define SERVER_FORUM                										    "forum.mafia-rp.su"
#define SERVER_GROUP                  										    "vk.com/mafiarpsamp"
#define SERVER_LANGUAGE                 										"Russian"

// types of dialog
#define DSM                                                                     DIALOG_STYLE_MSGBOX
#define DSL                                                                     DIALOG_STYLE_LIST
#define DSI                                                                     DIALOG_STYLE_INPUT
#define DSP                                                                     DIALOG_STYLE_PASSWORD
#define DST																		DIALOG_STYLE_TABLIST
#define DSTH																	DIALOG_STYLE_TABLIST_HEADERS

// colors
#define MAFIA_COLOR                                                             0xFF4D65FF
#define RED     															    0xFF0000FF
#define REDa                                                                    0xEB1D12CC
#define YELLOW    															    0xFFFF00FF
#define BLUE         															0x0000FFFF
#define GREEN    															    0x008000FF
#define AQUA        														    0x00FFFFFF
#define WHITE        															0xFFFFFFFF
#define GRAY         															0x80808088
#define LIGHT_GRAY                                                              0x6E7F8066
#define LIME     															    0x00FF00FF
#define BLACK        															0x000000FF
#define PINK                                                                    0xFFA2FFFF
#define ORANGE                                                                  0xF47721FF
#define ADMIN_COLOR                                                             0x65FF4DFF
#define PLAYER_COLOR                                                            0xEF2E2EFF

#define PINK1                                                                   0xFFA2FFFF
#define PINK2                                                                   0xFFA2FFDD
#define PINK3                                                                   0xFFA2FFBB
#define PINK4                                                                   0xFFA2FF99
#define PINK5                                                                   0xFFA2FF77

#define WHITE1                                                                  0xFFFFFFFF
#define WHITE2                                                                  0xFFFFFFDD
#define WHITE3                                                                  0xFFFFFFBB
#define WHITE4                                                                  0xFFFFFF99
#define WHITE5                                                                  0xFFFFFF77

// colors organizations
#define COLOR_NONE                    									   	    0xFFFFFFAA
#define COLOR_GOVERN                 									        0x62A382FF
#define COLOR_POLICE                      										0x0000FFFF
#define COLOR_ARMY                      										0x996633FF
#define COLOR_HOSPITAL                  										0xFF6666FF
#define COLOR_NEWS                    										    0xFF6600FF
#define COLOR_DRIVESCHOOL                                                       0xF7BE74FF
#define COLOR_MAFIA1                    			   							0xCCFFFFFF
#define COLOR_MAFIA2                    			   							0xCCFFFFFF
#define COLOR_MAFIA3                    			   							0xCCFFFFFF
#define COLOR_MAFIA4                    			   							0xCCFFFFFF
#define COLOR_MAFIA5                    			   							0xCCFFFFFF

#define COLOR_JOB                                                               0xF4DE6FFF
#define COLOR_BANK                                                              0x0C878FF
#define COLOR_NRP_CHAT                                                          0xF4DF94FF
#define COLOR_MASK                                                              0x687265FF

// prefixes
#define PrefixAdmLime                                                           "[{65FF4D}ADM{FFFFFF}]"
#define PrefixAdmYellow                                                         "[{FFF050}ADM{FFFFFF}]"
#define PrefixAdmRed                                                            "[{FF2424}ADM{FFFFFF}]"
#define PrefixPlayerError                                                       "[{EF2E2E}Ошибка{FFFFFF}]"
#define PrefixHint                                                              "[{8BFFF3}Подсказка{FFFFFF}]"
#define PrefixInfo                                                              "[{C8C154}Информация{FFFFFF}]"
#define PrefixSecurity                                                          "[{F46221}Безопасность{FFFFFF}]"
#define PrefixToAllPlayers                                                      "[{8BFFF3}Всем игрокам{FFFFFF}]"
#define PrefixJob                                                               "[{F4DE6F}Работа{FFFFFF}]"
#define PrefixJobLoader                                                         "{FF4D65}[Грузчики]{FFFFFF}"
#define PrefixJobMiner                                                          "{FF4D65}[Шахта]{FFFFFF}"
#define PrefixJobFireman                                                        "{FF4D65}[Пожарная часть]{FFFFFF}"
#define PrefixJobSwepper                                                        "{FF4D65}[Чистильщик дорог]{FFFFFF}"

#define PrefixR                                                                 "[{65FF4D}R{FFFFFF}]"
#define PrefixD                                                                 "[{65FF4D}D{FFFFFF}]"
#define PrefixF                                                                 "[{65FF4D}F{FFFFFF}]"
#define PrefixJ                                                                 "[{F4DE6F}J{FFFFFF}]"
#define PrefixSpouse                                                            "[{00FFFF}Супруг{FFFFFF}]"

// admin -> any player
#define AdmNotAuthorized                                                        !"[{FF2424}ADM{FFFFFF}] Вы не авторизованы! Используйте /alogin"
#define AdmPunishRemoved                                                        !"[{65FF4D}ADM{FFFFFF}] Наказание успешно снято!"
#define AdmNotAccess                                                            !"[{FF2424}ADM{FFFFFF}] У Вас нет доступа к этой команде!"
#define AdmPlayerInMute                                                         !"[{FF2424}ADM{FFFFFF}] Игрок уже в муте!"
#define AdmPlayerInJail                                                         !"[{FF2424}ADM{FFFFFF}] Игрок уже в деморгане!"
#define AdmPlayerInBan                                                          !"[{FF2424}ADM{FFFFFF}] Игрок уже заблокирован!"
#define AdmPlayerInBanIP                                                        !"[{FF2424}ADM{FFFFFF}] Игрок уже заблокирован по IP!"
#define AdmPlayerHasntPunish                                                    !"[{FF2424}ADM{FFFFFF}] У игрока отсутствует наказание!"
#define AdmPlayerOffline                                                        !"[{FF2424}ADM{FFFFFF}] Игрок не в сети!"
#define AdmPlayerNotAuthorized                                                  !"[{FF2424}ADM{FFFFFF}] Игрок не авторизован!"
#define AdmPlayerNotInOrg                                                       !"[{FF2424}ADM{FFFFFF}] Игрок не состоит в организации!"
#define AdmPlayerIsLeader                                                       !"[{FF2424}ADM{FFFFFF}] Игрок является лидером!"
#define AdmPlayerIsNotLeader                                                    !"[{FF2424}ADM{FFFFFF}] Игрок не является лидером!"
#define AdmPlayerIsAdm                                                          !"[{FF2424}ADM{FFFFFF}] Игрок является администратором!"
#define AdmPlayerIsNotAdm                                                       !"[{FF2424}ADM{FFFFFF}] Игрок не являестя администратором!"
#define AdmAccessTeleport                                                       !"[{65FF4D}ADM{FFFFFF}] Вы успешно телепортировались!"
#define AdmCantUseOnSelf                                                        !"[{FF2424}ADM{FFFFFF}] Нельзя использовать на себе!"

// self -> self
#define NotAuthorized               	                                        !"[{EF2E2E}Ошибка{FFFFFF}] Вы не авторизовались!"
#define InMute                              	                                !"[{EF2E2E}Ошибка{FFFFFF}] Вы не можете говорить и использовать некоторые команды, пока находитесь в муте!"
#define NoSuchCommand                                                           !"[{EF2E2E}Ошибка{FFFFFF}] Такой команды нет!"
#define WrongCommand                                                            !"[{EF2E2E}Ошибка{FFFFFF}] Вы неправильно ввели команду!"
#define NotAccess                                                               !"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет доступа к этой команде!"
#define CantUseOnThisPlayer                                                     !"[{EF2E2E}Ошибка{FFFFFF}] Вы не можете использовать эту команду на этом игроке"
#define NotInCar                                                                !"[{EF2E2E}Ошибка{FFFFFF}] Нельзя использовать в транспорте!"
#define CantUseOnSelf                                                           !"[{EF2E2E}Ошибка{FFFFFF}] Нельзя использовать на себе!"
#define NotInOrg                                                                !"[{EF2E2E}Ошибка{FFFFFF}] Вы не состоите в организации!"
#define NotWorking                                                              !"[{EF2E2E}Ошибка{FFFFFF}] Вы не на службе!"
#define NotInJob                                                                !"[{EF2E2E}Ошибка{FFFFFF}] Вы не устроены на работу!"
#define NotInJobTaxi                                                            !"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете в такси!"
#define NotInJobTrashmaster                                                     !"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете водителем мусоровоза!"
#define NotInJobSwepper                                                         !"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете чистильщиком дорог!"
#define NotInFam                                                                !"[{EF2E2E}Ошибка{FFFFFF}] Вы не состоите в семье!"
#define QuestComp                                                               !"[{EF2E2E}Ошибка{FFFFFF}] Это задание уже выполено!"
#define QuestNotComp                                                            !"[{EF2E2E}Ошибка{FFFFFF}] Это задание еще не выполнено!"
#define NotLvl                                                                  !"[{EF2E2E}Ошибка{FFFFFF}] У Вас недостаточно игрового уровня!"
#define NotCash                                                                 !"[{EF2E2E}Ошибка{FFFFFF}] У Вас недостаточно денег!"
#define HaveHome                                                                !"[{EF2E2E}Ошибка{FFFFFF}] У Вас уже есть дом!"
#define HaveHotel                                                               !"[{EF2E2E}Ошибка{FFFFFF}] У Вас уже есть комната в отеле!"
#define HaveCar                                                                 !"[{EF2E2E}Ошибка{FFFFFF}] У Вас уже есть машина!"
#define HaveBiz                                                                 !"[{EF2E2E}Ошибка{FFFFFF}] У Вас уже бизнес!"
#define HaventHome                                                              !"[{EF2E2E}Ошибка{FFFFFF}] У Вас отсутствует дом!"
#define HaventHotel                                                             !"[{EF2E2E}Ошибка{FFFFFF}] У Вас отсутствует комната в отеле!"
#define HaventCar                                                               !"[{EF2E2E}Ошибка{FFFFFF}] У Вас отсутствует машина!"
#define HaventBiz                                                               !"[{EF2E2E}Ошибка{FFFFFF}] У Вас отсутствует бизнес!"
#define HaventSpouse                                                            !"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет супруга!"

// self -> any player
#define PlayerOffline                                                           !"[{EF2E2E}Ошибка{FFFFFF}] Игрок не в сети!"
#define PlayerNotAuthorized                                                     !"[{EF2E2E}Ошибка{FFFFFF}] Игрок не авторизован!"
#define PlayerFarAway                                                           !"[{EF2E2E}Ошибка{FFFFFF}] Игрок слишком далеко от Вас!"

// orgs
#define NotInGovern                                                             !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Правительства!"
#define NotInFBI                                                                !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник ФБР!"
#define NotInPolice                                                             !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Полицейского департамента!"
#define NotInArmy                                                               !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Национальной армии!"
#define NotInHospital                                                           !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Центральной больницы!"
#define NotInNews                                                               !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Радиоцентра!"
#define NotInDriveSchool                                                        !"[{EF2E2E}Ошибка{FFFFFF}] Вы не сотрудник Автошколы!"
#define NotInMafia                                                              !"[{EF2E2E}Ошибка{FFFFFF}] Вы не состоите в Мафии!"

// functions
#define SCM                                              			            SendClientMessage
#define SCMtA                                                                   SendClientMessageToAll
#define SPD                                                                     ShowPlayerDialog
#define CO                                                                      CreateObject
#define CDO                                                                     CreateDynamicObject
#define RBFP																	RemoveBuildingForPlayer
#define ASV                                                                     AddStaticVehicle
#define ASVex                                                                   AddStaticVehicleEx
#define SPC                                                                     SetPlayerCheckpoint

// constants
#define MAX_ADMIN_RANK                                                          8
#define MAX_ORGANIZATIONS                                                       12
#define MAX_JOBS                                                                9
#define MAX_FAMILIES                                                            1000
#define MAX_HOUSES                                                              1000
#define MAX_BUSINESSES                                                          1000
#define MAX_TRASHCANS                                                           47
#define MAX_PERSONS                                                             2
#define MAX_GANGZONES                                                           100

// reg N log
#define RegAccount                                                              "Добро пожаловать на сервер Mafia Role Play!\n\
															                	Этот аккаунт не зарегистрирован.\n\n\
															                	Логин: %s\n\
															                    Введите пароль и нажмите \"Далее\".\n\n\
															                    Примечания:\n\
															            		- Пароль чувствительный к регистру.\n\
															                	- Длина пароля от 6 до 32 символов.\n\
															                	- В пароле можно использовать символы на кириллице и латинице.\n"

#define LogAccount                                                              "Добро пожаловать на сервер Mafia Role Play!\n\
														                        Этот аккаунт уже зарегистрирован.\n\n\
														                        Логин: %s\n\
														                        Введите пароль:"

// forms
#define Time                                                                    !"Время:\nЧас: %i\nМинут: %i\nСекунд: %i"
#define TrashmasterText                                                         "Мусоровоз\n\n[ Бак заполнен: %i% ]"
#define TrashcanText                                                            "Мусорный бак N%i\nЗаполнен: %i%\n\n[ Для взаимодействия нажмите ALT ]"
#define FireTruckText                                                           "Пожарная машина\n\n[ В баке %i литров ]"

#define BusinessText                                                            "Бизнес №%i\n%s\nГос.цена: %i\nВладелец: %s"
#define HouseText	                                                            "Дом №%i\nКласс: %s\nВладелец: %s\nГараж: %s"
#define GarageText                                                              "Гараж №%i\nКласс: %s\nСтатус: %s"

#define YouHaveRentCar                                                          "У Вас уже есть арендованный транспорт! Отменить аренду - /cancelrent"
#define DoYouWantToRentCar                                                      "Вы хотите арендовать этот транспорт и начать рабочий день?\n\nСтоимость аренды: %i$"
#define AccessRentCar                                                           "Вы успешно арендовали этот транспорт! Отменить аренду - /cancelrent"
#define UnrentCar                                                               "Вы отменили аренду транспорта! Техника отбуксирована на стоянку!"

#define ActorText                                                               "%s\n%s\n\n{FF4D65}[ Для общения нажмите ALT ]"

// radio
#define RadioMafia                                                              ""

#define RadioRecord                                                             ""

#define RadioEuropa 	                                                        "wss://metadataws.hostingradio.ru/"
#define RadioEuropaTop40                                                        ""
#define RadioEuropaNew                                                          ""
#define RadioEuropaParty                                                        ""
#define RadioEuropaLight                                                        ""
#define RadioEuropaUrban                                                        ""

#define RadioDFM                                                                "https://dfm.hostingradio.ru/dfm96.aacp"
#define RadioDFMDanceHall                                                       "https://dfm-dancehall.hostingradio.ru/dancehall96.aacp"
#define RadioDFMInsomnia                                                        "https://dfm-insomnia.hostingradio.ru/insomnia96.aacp"
#define RadioDFMDeep                                                            "https://dfm-dfmdeep.hostingradio.ru/dfmdeep96.aacp"
#define RadioDFMRussianDance                                                    "https://dfm-dfmrusdance.hostingradio.ru/dfmrusdance96.aacp"
#define RadioDFMGangstaDeep                                                     "https://dfm-gangstadeep.hostingradio.ru/gangstadeep96.aacp"
#define RadioDFMRussianRave                                                     "https://dfm-russianrave.hostingradio.ru/russianrave96.aacp"
#define RadioDFMParty                                                           "https://dfm-party.hostingradio.ru/dfmparty96.aacp"
#define RadioDFMBassSlap                                                        "https://dfm-slapbass.hostingradio.ru/slapbass96.aacp"
#define RadioDFMDisco90                                                         "https://dfm-disc90.hostingradio.ru/disc9096.aacp"
#define RadioDFMArminVanBuuren                                                  "https://dfm-avburren.hostingradio.ru/avburren96.aacp"
#define RadioDFMAvicii                                                          "https://dfm-avicii.hostingradio.ru/avicii96.aacp"
#define RadioDFMDavidGuetta                                                     "https://dfm-guetta.hostingradio.ru/guetta96.aacp"
#define RadioDFMTiesto                                                          "https://dfm-tiesto.hostingradio.ru/tiesto96.aacp"
#define RadioDFMTheProdigy                                                      "https://dfm-prodigy.hostingradio.ru/prodigy96.aacp"
#define RadioDFMSwedishHouseMafia                                               "https://dfm-housemafia.hostingradio.ru/housemafia96.aacp"
#define RadioDFMCalvinHarris                                                    "https://dfm-harris.hostingradio.ru/harris96.aacp"
#define RadioDFMMartinGarrix                                                    "https://dfm-garrix.hostingradio.ru/garrix96.aacp"
#define RadioDFMSkrillex                                                        "https://dfm-skrillex.hostingradio.ru/skrillex96.aacp"
#define RadioDFMChill                                                           "https://dfm-dfmchill.hostingradio.ru/dfmchill96.aacp"
#define RadioDFMDanceGold1990                                                   "https://dfm-dancegold90.hostingradio.ru/dancegold9096.aacp"
#define RadioDFMDanceGold2000                                                   "https://dfm-dancegold10.hostingradio.ru/dancegold0096.aacp"
#define RadioDFMDanceGold2010                                                   "https://dfm-dancegold20.hostingradio.ru/dancegold1096.aacp"
#define RadioDFMDanceGold2020                                                   "https://dfm-dancegold90.hostingradio.ru/dancegold2096.aacp"
#define RadioDFMRemake                                                          "https://dfm-remake.hostingradio.ru/remake96.aacp"
#define RadioDFMPopGold1990                                                     "https://dfm-popgold90.hostingradio.ru/popgold9096.aacp"
#define RadioDFMPopGold2000                                                     "https://dfm-popgold90.hostingradio.ru/popgold0096.aacp"
#define RadioDFMPopGold2010                                                     "https://dfm-popgold90.hostingradio.ru/popgold1096.aacp"
#define RadioDFMPopGold2020                                                     "https://dfm-popgold90.hostingradio.ru/popgold2096.aacp"
#define RadioDFMKPop                                                            "https://dfm-kpop.hostingradio.ru/kpop96.aacp"
#define RadioDFMFestivalGold                                                    "https://dfm-festivalgold.hostingradio.ru/festivalgold96.aacp"
#define RadioDFMClub                                                            "https://dfm-dfmclub.hostingradio.ru/dfmclub96.aacp"
#define RadioDFMBassHouse                                                       "https://dfm-basshouse.hostingradio.ru/basshouse96.aacp"
#define RadioDFMOrganicHouse                                                    "https://dfm-organichouse.hostingradio.ru/organichouse96.aacp"
#define RadioDFMTechHouse                                                       "https://dfm-techhouse.hostingradio.ru/techhouse96.aacp"
#define RadioDFMRussianGold                                                     "https://dfm-russiangold.hostingradio.ru/russiangold96.aacp"
#define RadioDFMSadDance                                                        "https://dfm-saddance.hostingradio.ru/saddance96.aacp"
#define RadioDFMRap                                                             "https://dfm-dfmrap.hostingradio.ru/dfmrap96.aacp"
#define RadioDFMKalianRap                                                       "https://dfm-kalianrap.hostingradio.ru/kalianrap96.aacp"
#define RadioDFMPopDance                                                        "https://dfm-popdance.hostingradio.ru/popdance96.aacp"
#define RadioDFMVocalTrance                                                     "https://dfm-trance.hostingradio.ru/trance96.aacp"
#define RadioDFMPsyTrance                                                       "https://dfm-psytrance.hostingradio.ru/psytrance96.aacp"
#define RadioDFMHandsUp                                                         "https://dfm-handsup.hostingradio.ru/handsup96.aacp"
#define RadioDFMTrap                                                            "https://dfm-dfmtrap.hostingradio.ru/dfmtrap96.aacp"
#define RadioDFMFutureBass                                                      "https://dfm-futurebass.hostingradio.ru/futurebass96.aacp"
#define RadioDFMVocalDrum                                                       "https://dfm-drum.hostingradio.ru/drum96.aacp"
#define RadioDFMLiquidFunk                                                      "https://dfm-liquid.hostingradio.ru/liquid96.aacp"
#define RadioDFMPump                                                            "https://dfm-pump.hostingradio.ru/pump96.aacp"
#define RadioDFMBreakBeat                                                       "https://dfm-breakbeat.hostingradio.ru/breakbeat96.aacp"
#define RadioDFMDisco                                                           "https://dfm-disco.hostingradio.ru/disco96.aacp"

#define RadioHitFM                                                              "https://hitfm.hostingradio.ru/hitfm96.aacp"
#define RadioHitFMSmartPop                                                      "https://hitfm-smartpop.hostingradio.ru/smartpop96.aacp"
#define RadioHitFMSoftRock1990                                                  "https://hitfm-softrock90.hostingradio.ru/softrock9096.aacp"
#define RadioHitFMSoftRock2000                                                  "https://hitfm-softrock00.hostingradio.ru/softrock0096.aacp"
#define RadioHitFMSoftRock2010                                                  "https://hitfm-softrock10.hostingradio.ru/softrock1096.aacp"
#define RadioHitFMPositive                                                      "https://hitfm-positive.hostingradio.ru/hitpositive96.aacp"
#define RadioHitFMDance1990                                                     "https://hitfm-hitdance90.hostingradio.ru/hitdance9096.aacp"
#define RadioHitFMDance2000                                                     "https://hitfm-hitdance00.hostingradio.ru/hitdance0096.aacp"
#define RadioHitFMDance2010                                                     "https://hitfm-hitdance10.hostingradio.ru/hitdance1096.aacp"
#define RadioHitFMParty                                                         "https://hitfm-party.hostingradio.ru/hitparty96.aacp"
#define RadioHitFMHipHop                                                        "https://hitfm-hiphop.hostingradio.ru/hithiphop96.aacp"
#define RadioHitFMBallads                                                       "https://hitfm-ballads.hostingradio.ru/ballads96.aacp"

#define RadioEnergy                                                             "https://pub0202.101.ru:8443/stream/air/aac/64/99"
#define RadioNew                                                                "https://icecast-newradio.cdnvideo.ru/newradio3"
#define RadioLikeFM                                                             "https://pub0101.101.ru/stream/air/aac/64/219"
#define RadioRusskoe                                                            "https://rusradio.hostingradio.ru/rusradio96.aacp"
#define RadioHumorFM                                                            "https://pub0101.101.ru/stream/air/aac/64/102"
#define RadioMir                                                                "https://icecast-mirtv.cdnvideo.ru/radio_mir128"
#define RadioAvto                                                               "https://pub0202.101.ru:8443/stream/reg/mp3/128/region_avto_113"
#define RadioDorojnoe                                                           ""

#define RadioZaycevPop                                                          "https://zaycevfm.cdnvideo.ru/ZaycevFM_pop_256.mp3"
#define RadioZaycevDisco                                                        "https://zaycevfm.cdnvideo.ru/ZaycevFM_disco_256.mp3"
#define RadioZaycevClub                                                         "https://zaycevfm.cdnvideo.ru/ZaycevFM_club_256.mp3"
#define RadioZaycevNewRock                                                      "https://zaycevfm.cdnvideo.ru/ZaycevFM_rock_256.mp3"
#define RadioZaycevRNB                                                          "https://zaycevfm.cdnvideo.ru/ZaycevFM_rnb_256.mp3"
#define RadioZaycevChanson                                                      "https://zaycevfm.cdnvideo.ru/ZaycevFM_shanson_256.mp3"
#define RadioZaycevRus                                                          "https://zaycevfm.cdnvideo.ru/ZaycevFM_rus_256.mp3"
#define RadioZaycevRelax                                                        "https://zaycevfm.cdnvideo.ru/ZaycevFM_relax_256.mp3"
#define RadioZaycevKids                                                         "https://zaycevfm.cdnvideo.ru/ZaycevFM_zaychata_256.mp3"
#define RadioZaycevKPop                                                         "https://zaycevfm.cdnvideo.ru/ZaycevFM_kpop_256.mp3"
#define RadioZaycevRap                                                          "https://zaycevfm.cdnvideo.ru/ZaycevFM_rap_256.mp3"
#define RadioZaycevMetal                                                        "https://zaycevfm.cdnvideo.ru/ZaycevFM_metal_256.mp3"
#define RadioZaycevNewYear                                                      "https://zaycevfm.cdnvideo.ru/ZaycevFM_newyear_256.mp3"
#define RadioZaycevBass                                                         "https://zaycevfm.cdnvideo.ru/ZaycevFM_bass_256.mp3"
#define RadioZaycevLove                                                         "https://zaycevfm.cdnvideo.ru/ZaycevFM_holiday_256.mp3"
#define RadioZaycevRusRock                                                      "https://zaycevfm.cdnvideo.ru/ZaycevFM_rurock_256.mp3"
#define RadioZaycevFolkRock                                                     "https://zaycevfm.cdnvideo.ru/ZaycevFM_folk_256.mp3"
#define RadioZaycevClassic                                                      "https://zaycevfm.cdnvideo.ru/ZaycevFM_classic_256.mp3"

#define RadioMonteCarlo                                                         "https://montecarlo.hostingradio.ru/montecarlo96.aacp"
#define RadioPolice                                                             "https://radiomv.hostingradio.ru:80/radiomv128.mp3"
#define RadioDacha                                                              "https://stream.n340.com/14_dacha_28?type=.aac&UID=DBD836A894CDB34B4A9FE94219A1B29E"
#define RadioRetroFM                                                            ""
#define RadioNashe                                                              "https://nashe1.hostingradio.ru:80/nashe-128.mp3"
#define RadioChanson                                                            "https://chanson.hostingradio.ru:8041/chanson128.mp3"
#define RadioVestiFM                                                            "https://icecast-vgtrk.cdnvideo.ru/vestifm_mp3_192kbps"

// buttons
#define ButtonSelect                                                            "Выбрать"
#define ButtonFurther                                                           "Далее"
#define ButtonBack                                                              "Назад"
#define ButtonExit                                                              "Выйти"

// other
#pragma dynamic 32768
//#pragma pack 1

main(){
	new m[5];
	format(m[0],sizeof(m),"QWERTYUIOP");
	format(m[1],sizeof(m),"ASDFGHJKL:@");
	printf("%s %s",m[0],m[1]);
}

forward LoadInfoServer();
forward Advertisement1();
forward Advertisement2();
forward UpdatePlayedTime();
forward DeacreasingFuel();
forward UpdateSpeed(playerid);
forward SystemAFK();
forward UpdatePlayer(playerid);

enum playerVariables {
    pID,                                                                        // -
    pName[MAX_PLAYER_NAME],                                                     // case 28, 29
	pNowIP[16],                                                                 // -
    pAdmin,                                                                     // static stock
    pLVL,                                                                       // static stock
	pEXP,                                                                       // static stock
    pCash,                                                                      // static stock
    bool:pColorName,                                                              // case 50
    bool:pSex,                                                                    // case 80 (смена пола в больничке)
    bool:pSkinColor,                                                            // case 81 (смена цвета кожи в больничке)
    //pSkinID,                                                                    // static stock
	pSpawnPlace,                                                                // case 30
    
    Float:pHeal,                                                                // save account
    Float:pArmour,                                                               // save account
    Float:pSatiety,                                                             // save account
    
    pBan,                                                                       // case 40 (окно при бане)
    pWarn,                                                                      // case 41 (окно при варне)
    pJail,                                                                      // case 42 (окно при джаиле)
    pMute,                                                                      // case 43 (окно при муте)

    pOrgID,                                                                     // case 50
    pOrgRank,                                                                   // case 50
    pOrgReprimands,
    bool:pOrgWorking,                                                           // -
    
    pJobID,                                                                     // case 51
    pJobRank,
    bool:pJobWorking,                                                           // -
    pJobSalary,
    
	pFamID,
	pFamRank,

   	bool:pBankCard,                                                         // static stock
	pBankPassword[12],                                                          // static stock
	pBankCash,                                                                  // static stock
	pBankDeposit,                                                               // static stock
	pBankCharity,                                                                   // static stock
	
	bool:pPhone,
	pPhoneNumber,
	pPhoneBalance,
	bool:pPhoneIsOn,
	
	pSkillPistol,
    pSkillSDPistol,
    pSkillDesertEagle,
	pSkillShotgun,
	pSkillShotgunSawnoff,
	pSkillShotgunSpas12,
	pSkillUZI,
	pSkillMP5,
    pSkillAK47,
    pSkillM4A1,
	pSkillSniper,
	
	pSkillStyleNormal,
	pSkillStyleBoxing,
	pSkillStyleKungfu,
	pSkillStyleKneehead,
	pSkillStyleGrabkick,
	pSkillStyleElbow,
	
	pStyleFight,
	pStyleWalking,
	pEnergy,
	
	pLicAuto,
	pLicShip,
	pLicAir,
	pLicMoto,
	pLicGun,
	pMedcard,
	
    pSpouse,                                                   // case 54
	pWantedLevel,
	pPrisonTime,
	pLaw,                                                                       // static stock
    pFine,                                                                      // static stock
    pDrugAddiction,
	
	pStatus,                                                                // static stock
	pDonat,                                                                     // static stock
	pQuests,                                                                    // static stock
	pGuns[56],                                                                  // save account
	pPlayedTime,                                                                // save account
    pWhereKnew,                                                                 // static stock
	pMafiaDebt,
    
	bool:pSettingsAdminAction,
	bool:pSettingsAdds,
	bool:pSettingsBroadcast,
	bool:pSettingsOrgChat,
	bool:pSettingsFamChat,
	bool:pSettingsJobChat,
	
	// temp
    bool:pLogged,
    pWrongPassword,
	bool:pInMask,
	bool:pOpenedInventory,
    pAFK,
    pTimerEx
}

enum adminVariables {
	aID,
	aName[MAX_PLAYER_NAME],
	aPassword[32],
	aLVL,
	aNameRank[24],
	
	aRating,
	aCountBan,
	aCountWarn,
	aCountJail,
	aCountMute,
	aCountKick,
	aCountReport,
	
	bool:aLogged,
	aWrongPassword,
	bool:aSpectating
}

enum organizationVariables {
	oID,
	oName[32],
	
	oRankName1[32],
	oRankName2[32],
	oRankName3[32],
	oRankName4[32],
	oRankName5[32],
	oRankName6[32],
	oRankName7[32],
	oRankName8[32],
	oRankName9[32],
	oRankName10[32],
	
	oSkinM[11],
	oSkinF[11],
	oSalary[11],
	
	oBalance,
	oAmmunition,
	oMedicines,
	oMaterials,
	oDrugs,
	bool:oStatus
}

enum jobVariables {
	jID,
	jName[32],
	
	jSkinM,
	jSkinF,
	
	jSalary[5]
}

enum familyVariables {
	fID,
	fName[MAX_PLAYER_NAME],
	fLeader,
	fDeputy1,
	fDeputy2,
	fDeputy3,
	
	fColor,
	fStatus,
	
	fHouseID,
	fCash,
}

enum houseVariables {
	hID,
	hType,
	Float:hX,
	Float:hY,
	Float:hZ,
	hPrice,
	hName[32],
	hPaying,
	hPayed,
	
	bool:hGarage,
	Float:hGarageX,
	Float:hGarageY,
	Float:hGarageZ,
	hGarageInterior,
	
	bool:hBasement,
	hBasementInterior,
	
	bool:hDoorHouse,
	bool:hDoorGarage,
	bool:hDoorBasement,
	
	hOwner,
	hDeputy,
	hFamily
}

enum buisnessVariables {
	bID,
	bType,
	Float:bX,
	Float:bY,
	Float:bZ,
	
	bPrice,
	bOwner,
	bName[32],
	bPaying,
	bInterior,
	bPriceForEnter,
	
	bFamilyForSale,
	bMafiaControl,
	bool:bDoor
}

enum vehicleVariables {
	vID,
	
	bool:vEngine,
	bool:vLights,
	bool:vAlarm,
	bool:vDoors,
	bool:vBonnet,
	bool:vBoot,
	bool:vObjective,
	
	bool:vLock,
 	bool:vTurnLeft,
 	bool:vTurnRight,
 	vLeftID1,
 	vLeftID2,
 	vRightID1,
 	vRightID2,

	vFuel,
	vMilliage,
	
	Float:vX,
	Float:vY,
	Float:vZ
}

enum adminSystemVariables {
	aID,
	aName[32]
}

enum inventoryVariables {
	iCurrSkin,
	iAcs1,
	iAcs2,
	iAcs3,
	iAcs4,
	iAcs5,
	iAcs6,
	iAcs7,
	
	iMask,
	iRemKit,
	iAidKit,
	iRadio,
	iBatteries,
	iLocks,
	iCartridges,
	iParashut
}

enum truckVariables {
	tID,
	tFullness,
	Text3D:t3D
}

enum trashcanVariables {
	tID,
	tType,
	
	Float:tX,
	Float:tY,
	Float:tZ,
	Float:tRX,
	Float:tRY,
	Float:tRZ,
	
	tFullness,
	tCell1,
	tCell2,
	tCell3,
	tCell4,
	tCell5,
	tCell6,
	tCell7,
	tCell8,
	tCell9,
	
	Text3D:t3D
}

enum actorVariables {
	aID,
	aName[24],
	aProfession[16],
	
	Float:aX,
	Float:aY,
	Float:aZ,
	Float:aAngle
}

enum gangVariables {
	gID,
	gFamID,

	Float:gTopLeftX,
	Float:gTopLeftY,
	Float:gBottomRightX,
	Float:gBottomRightY
}

enum tdSpeedometerVariables {
	Text:tdID
}

enum previewIcon {
	Text:pText,
	Text:p
}

enum enumIDandName {
	ID_,
	Name_[32]
}

enum enumIDandNumber {
	ID_,
	Number
}

enum enumIDandRanks {
 	Ranks[11]
}


static const stock orgNames[][25] = {
	{0, "Отсутствует"},
	{1, "Правительство"},
	{2, "ФБР"},
	{3, "Полицейский департамент"},
	{4, "Национальная гвардия"},
	{5, "Центральная больница"},
	{6, "Радиоцентр"},
	{7, "Автошкола"},
	{8, "Мафия1"},
	{9, "Мафия2"},
	{10, "Мафия3"},
	{11, "Мафия4"},
	{12, "Мафия5"}
};

static const stock orgRanks[13][11][32] = {
	{0,"Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует","Отсутствует"},
	{1,"Охранник","Старший охранник","Аудитор","Секретарь","Адвокат","Судья","Депутат","Министр","Вице-президент","Президент"},
 	{2,"Стажер","","","","","","","","","Директор"},
 	{3,"","","","","","","","","",""},
 	{4,"","","","","","","","","",""},
 	{5,"","","","","","","","","",""},
 	{6,"","","","","","","","","",""},
 	{7,"","","","","","","","","",""},
 	{8,"","","","","","","","","",""},
 	{9,"","","","","","","","","",""},
 	{10,"","","","","","","","","",""},
 	{11,"","","","","","","","","",""},
 	{12,"","","","","","","","","",""}
};

new orgColors[13] = {
	COLOR_NONE,COLOR_GOVERN,COLOR_POLICE,COLOR_POLICE,COLOR_ARMY,COLOR_HOSPITAL,COLOR_NEWS,
	COLOR_DRIVESCHOOL,COLOR_MAFIA1,COLOR_MAFIA2,COLOR_MAFIA3,COLOR_MAFIA4,COLOR_MAFIA5
};



enum enumJSON {
	eKey,
	eValue[32]
}

static const stock playerSex[][enumJSON] = {
	{0, "мужской"},
	{1, "женский"}
};

static const stock playerSkinColor[][enumJSON] = {
	{0, "светлый"},
	{1, "темный"}
};

static const stock playerColorName[][enumJSON] = {
	{0, COLOR_NONE},
	{1, COLOR_MASK}
};

static const stock playerStatus[][enumJSON] = {
	{0, "Игрок"},
	{1, "Premium-игрок"},
	{2, "VIP-игрок"}
};

static const stock adminRanks[][enumIDandRanks] = {
	{0, "Отсутствует"},
	{1, "1"},
	{2, "2"},
	{3, ""}
};

static const stock jobNames[][enumJSON] = {
	{0, "Отсутствует"},
	{1, "Такси"},
	{2, "Водитель автобуса"},
	{3, "Механик"},
	{4, "Водитель мусоровоза"},
	{5, "Доставщик пиццы"},
	{6, "Доставщик продуктов"},
	{7, "Дальнобойщик"},
	{8, "Инкассатор"}
};

static const stock busiunessTypes[][enumJSON] = {
	{0, "None"},
	{1, "Магазин 24/7"},
	{2, "АЗС"},
	{3, "Пиццерия"},
	{4, "Фаст-фуд"},
	{5, "Ресторан"},
	{6, "Ларек с едой"},
	{7, "Аренда т/с"}
};

static const stock houseTypes[][enumJSON] = {
	{0, "None"},
	{1, "Низкий"},
	{2, "Средний"},
	{3, "Высокий"},
	{4, "Элитный"}
};

static const stock garageTypes[][enumJSON] = {
	{0, "None"},
	{1, "Малый"},
	{2, "Средний"},
	{3, "Большой"},
	{4, "Крупный"}
};

static const stock familyStatuses[][enumJSON] = {
	{0, "None"},
	{1, "Family"},
	{2, "Brotherhood"},
	{3, "Dynasty"},
 	{4, "Empire"},
 	{5, "Clan"}
};

static const stock familyColors[][enumJSON] = {
	{0, "None"},
	{1, RED},
	{2, GREEN},
	{3, BLUE}
};

static const stock HaveOrNot[][enumJSON] = {
 	{0, "отсутствует"},
 	{1, "имеестся"}
};

static const stock vehicleTypes[][enumJSON] = {
	{0, "None"},
	{1, ""},
	{2, ""}
};

static const stock MonthsRU[][enumJSON] = {
	{1, "январь"},
	{2, "февраль"},
	{3, "март"},
	{4, "апрель"},
	{5, "май"},
	{6, "июнь"},
	{7, "июль"},
	{8, "август"},
	{9, "сентябрь"},
	{10, "октябрь"},
	{11, "ноябрь"},
	{12, "деабрь"}
};

static const stock MonthsEN[][enumJSON] = {
	{1, "january"},
	{2, "february"},
	{3, "march"},
	{4, "april"},
	{5, "may"},
	{6, "june"},
	{7, "jule"},
	{8, "august"},
	{9, "september"},
	{10, "october"},
	{11, "november"},
	{12, "december"}
};

enum enumISFFF {
	eI,
	eS[32],
	Float:eF1,
	Float:eF2,
	Float:eF3
}

static const stock placesPositions[][enumISFFF] = {
	{0,  "None",			 0.0, 0.0, 0.0},
	{1,  "Правительство",	 1.1, 1.1, 1.1}
};

static const stock interiorsHouse[][enumJSON] = {};
static const stock interiorsGarages[][enumJSON] = {};



enum vehicleParams {
 	vID,
 	vName[32],
 	vMaxSpeed,
 	vMaxFuel,
 	vGosPrice
}

static const stock vehicleParam[][vehicleParams] = {
	{400,	"Landstalker",		88,		80,		210000},
	{401,	"Bravura",			83,		40,		170000},
	{402,	"Buffalo",			104,	50,		480000},
	{403,	"Linerunner",		61,		140,	0},
	{404,	"Pereniel",			74,		40,		150000},
	{405,	"Sentinel",			91,		50,		330000},
	{406,	"Dumper",			61,		200, 	0},
	{407,	"Firetruck",		82,		100,	0},
	{408,	"Trashmaster",		66,		80,		0},
	{409,	"Stretch",			88,		60,		300000},
	{410,	"Manana",			72,		50,		155000},
	{411,	"Infernus",			122,	80, 	1200000},
	{412,	"Voodoo",			95,		60,		290000},
	{413,	"Pony",				61,		110,	0},
	{414,	"Mule",				68,		110,	0},
	{415,	"Cheetah",			107,	70,		850000},
	{416,	"Ambulance",		88,		80,		0},
	{417,	"Leviathan",		0,		190,	0},
	{418,	"Moonbeam",			68,		70,		185000},
	{419,	"Esperanto",		82,		50,		245000},
	{420,	"Taxi",				81,		60,		10},
	{421,	"Washington",		86,		70,		7},
	{422,	"Bobcat",			78,		80,		8},
	{423,	"Mr Whoopee",		66,		35,		5},
	{424,	"BF Injection",		76,		40,		12},
	{425,	"Hunter",			0,		0,		0},
	{426,	"Premier",			96,		60,		6},
	{427,	"Enforcer",			92,		120,		12},
	{428,	"Securicar",		87,		120,		12},
	{429,	"Banshee",			112,	50,		10},
	{430,	"Predator",			0,		0,		0},
	{431,	"Bus",				72,		100,		10},
	{432,	"Rhino",			81,		200,		25},
	{433,	"Barracks",			61,		150,		18},
	{434,	"Hotknife",			93,		30,		10},
	{435,	"Trailer",			0,		0,		0},
	{436,	"Previon",			83,		35,		11},
	{437,	"Coach",			88,		100,		10},
	{438,	"Cabbie",			79,		40.0,		9},
	{439,	"Stallion",			94,		45.0,		7},
	{440,	"Rumpo",			76,		100.0,		9},
	{441,	"RC Bandit",		0,		0.0,		0},
	{442,	"Romero",			77,		60.0,		12},
	{443,	"Packer",			70,		140.0,		13},
	{444,	"Monster Truck A",	98,		100.0,		20},
	{445,	"Admiral",			91,		60.0,		9},
	{446,	"Squalo",			0,		0.0,		0},
	{447,	"Seasparrow",		0,		0.0,		13},
	{448,	"Pizzaboy",			93,		0.0,		0},
	{449,	"Tram",				101,	0.0,		0},
	{450,	"Trailer",			0,		0.0,		0},
	{451,	"Turismo",			107,	80.0,		10},
	{452,	"Speeder",			0,		0.0,		0},
	{453,	"Reefer",			0,		0.0,		0},
	{454,	"Tropic",			0,		0.0,		0},
	{455,	"Flatbed",			87,		110.0,		11},
	{456,	"Yankee",			59,		110.0,		10},
	{457,	"Caddy",			62,		20.0,		3},
	{458,	"Solair",			87,		50.0,		12},
	{459,	"Berkley's RC Van",	76,		70.0,		10},
	{460,	"Skimmer",			0,		0.0,		0},
	{461,	"PCJ-600",			88,		125.0,		9},
	{462,	"Faggio",			61,		15.0,		9},
	{463,	"Freeway",			78,		135.0,		5},
	{464,	"RC Baron",			0,		0.0,		0},
	{465,	"RC Raider",		0,		0.0,		0},
	{466,	"Glendale",			82,		60.0,		8},
	{467,	"Oceanic",			78,		60.0,		8},
	{468,	"Sanchez",			78,		115.0,		6},
	{469,	"Sparrow",			0,		190.0,		13},
	{470,	"Patriot",			87,		80.0,		10},
	{471,	"Quad",				61,		130.0,		5},
	{472,	"Coastguard",		0,		0.0,		0},
	{473,	"Dinghy",			0,		0.0,		0},
	{474,	"Hermes",			82,		50.0,		8},
	{475,	"Sabre",			97,		50.0,		8},
	{476,	"Rustler",			0,		0.0,		0},
	{477,	"ZR-350",			104,	50.0,		9},
	{478,	"Walton",			66,		35.0,		9},
	{479,	"Regina",			78,		70.0,		7},
	{480,	"Comet",			102,	40.0,		8},
	{481,	"BMX",				80,		0.0,		0},
	{482,	"Burrito",			87,		70.0,		11},
	{483,	"Camper",			86,		50.0,		10},
	{484,	"Marquis",			0,		0.0,		0},
	{485,	"Baggage",			56,		0.0,		0},
	{486,	"Dozer",			39,		50.0,		19},
	{487,	"Maverick",			0,		190.0,		8},
	{488,	"News Chopper",		0,		190.0,		8},
	{489,	"Rancher",			77,		80.0,		8},
	{490,	"FBI Rancher",		82,		80.0,		8},
	{491,	"Virgo",			82,		45.0,		7},
	{492,	"Greenwood",		78,		50.0,		7},
	{493,	"Jetmax",			118,	0.0,		0},
	{494,	"Hotring",			98,		50.0,		17},
	{495,	"Sandking",			90,		100.0,		10},
	{496,	"Blista Compact",	60,		40.0,		7},
	{497,	"Police Maverick",	0,		190.0,		8},
	{498,	"Boxville",			60,		80.0,		9},
	{499,	"Benson",			68,		80.0,		9},
	{500,	"Mesa",				78,		40.0,		7},
	{501,	"RC Goblin",		0,		0.0,		0},
	{502,	"Hotring Racer A",	119,	50.0,		18},
	{503,	"Hotring Racer B",	119,	50.0,		17},
	{504,	"Bloodring Banger",	96,		50.0,		12},
	{505,	"Rancher",			78,		80.0,		12},
	{506,	"Super GT",			100,	50.0,		8},
	{507,	"Elegant",			92,		60.0,		7},
	{508,	"Journey",			60,		45.0,		12},
	{509,	"Bike",				90,		0.0,		0},
	{510,	"Mountain Bike",	110,	0.0,		0},
	{511,	"Beagle",			0,		0.0,		0},
	{512,	"Cropdust",			0,		0.0,		0},
	{513,	"Stunt",			0,		0.0,		0},
	{514,	"Tanker",			67,		120.0,		12},
	{515,	"Roadtrain",		79,		140.0,		14},
	{516,	"Nebula",			87,		50.0,		9},
	{517,	"Majestic",			88,		50.0,		7},
	{518,	"Buccaneer",		91,		50.0,		7},
	{519,	"Shamal",			0,		120.0,		15},
	{520,	"Hydra",			0,		0.0,		0},
	{521,	"FCR-900",			109,	130.0,		6},
	{522,	"NRG-500",			98,		145.0,		6},
	{523,	"HPV1000",			104,	125.0,		6},
	{524,	"Cement Truck",		72,		80.0,		10},
	{525,	"Tow Truck",		89,		50.0,		9},
	{526,	"Fortune",			88,		50.0,		7},
	{527,	"Cadrona",			83,		40.0,		6},
	{528,	"FBI Truck",		98,		60.0,		12},
	{529,	"Willard",			83,		60.0,		10},
	{530,	"Forklift",			33,		15.0,		3},
	{531,	"Tractor",			39,		20.0,		4},
	{532,	"Combine",			61,		30.0,		7},
	{533,	"Feltzer",			93,		40.0,		6},
	{534,	"Remington",		94,		60.0,		6},
	{535,	"Slamvan",			88,		60.0,		6},
	{536,	"Blade",			96,		60.0,		12},
	{537,	"Freight",			0,		0.0,		0},
	{538,	"Streak",			0,		0.0,		0},
	{539,	"Vortex",			55,		10.0,		2},
	{540,	"Vincent",			83,		50.0,		10},
	{541,	"Bullet",			113,	50.0,		6},
	{542,	"Clover",			91,		50.0,		6},
	{543,	"Sadler",			84,		50.0,		6},
	{544,	"Firetruck",		82,		90.0,		12},
	{545,	"Hustler",			82,		35.0,		6},
	{546,	"Intruder",			83,		50.0,		8},
	{547,	"Primo",			79,		50.0,		8},
	{548,	"Cargobob",			0,		0.0,		0},
	{549,	"Tampa",			80,		50.0,		6},
	{550,	"Sunrise",			80,		50.0,		6},
	{551,	"Merit",			87,		50.0,		6},
	{552,	"Utility",			67,		50.0,		5},
	{553,	"Nevada",			0,		0.0,		0},
	{554,	"Yosemite",			80,		50.0,		6},
	{555,	"Windsor",			88,		50.0,		5},
	{556,	"Monster Truck B",	62,		100.0,		10},
	{557,	"Monster Truck C",	62,		100.0,		10},
	{558,	"Uranus",			87,		50.0,		6},
	{559,	"Jester",			99,		50.0,		6},
	{560,	"Sultan",			94,		50.0,		6},
	{561,	"Stratum",			85,		50.0,		6},
	{562,	"Elegy",			99,		50.0,		6},
	{563,	"Raindance",		0,		0.0,		0},
	{564,	"RC Tiger",			0,		0.0,		0},
	{565,	"Flash",			92,		50.0,		6},
	{566,	"Tahoma",			89,		50.0,		6},
	{567,	"Savanna",			96,		50.0,		6},
	{568,	"Bandito",			81,		15.0,		4},
	{569,	"Freight",			0,		10.0,		3},
	{570,	"Trailer",			0,		0.0,		0},
	{571,	"Kart",				52,		10.0,		3},
	{572,	"Mower",			33,		10.0,		3},
	{573,	"Duneride",			61,		35.0,		5},
	{574,	"Sweeper",			33,		10.0,		3},
	{575,	"Broadway",			88,		50.0,		6},
	{576,	"Tornado",			88,		50.0,		6},
	{577,	"AT-400",			0,		0.0,		0},
	{578,	"DFT-30",			72,		70.0,		12},
	{579,	"Huntley",			88,		70.0,		6},
	{580,	"Stafford",			85,		50.0,		6},
	{581,	"BF-400",			110,	25.0,		12},
	{582,	"Newsvan",			76,		80.0,		6},
	{583,	"Tug",				47,		10.0, 		3},
	{584,	"Trailer",			0,		0.0, 		0},
	{585,	"Emperor",			85,		50.0,		6},
	{586,	"Wayfarer",			107,	125.0,		5},
	{587,	"Euros",			92,		70.0,		6},
	{588,	"Hotdog",			60,		30.0,		6},
	{589,	"Club",				90,		50.0,		6},
	{590,	"Trailer",			0,		0.0,		0},
	{591,	"Trailer",			0,		0.0,		0},
	{592,	"Andromada",		0,		0.0,		0},
	{593,	"Dodo",				0,		190.0,		7},
	{594,	"RC Cam",			0,		0.0,		0},
	{595,	"Launch",			0,		0.0,		0},
	{596,	"Police Car (LSPD)",98,		50.0,		5},
	{597,	"Police Car (SFPD)",98,		50.0,		5},
	{598,	"Police Car (LVPD)",98,		50.0,		5},
	{599,	"Police Ranger",	88,		80.0,		6},
	{600,	"Picador",			84,		40.0,		6},
	{601,	"S.W.A.T. Van",		61,		30.0,		5},
	{602,	"Alpha",			94,		50.0,		6},
	{603,	"Phoenix",			95,		50.0,		6},
	{604,	"Glendale",			82,		50.0,		6},
	{605,	"Sadler",			84,		50.0,		6},
	{606,	"Luggage Trailer",	0,		0.0,		0},
	{607,	"Luggage Trailer",	0,		0.0,		0},
	{608,	"Stair Trailer",	0,		0.0,		0},
	{609,	"Boxville",			60,		50.0,		6},
	{610,	"Farm Plow",		0,		0.0,		0},
	{611,	"Utility Trailer",	0,		0.0,		0}
};

enum cityDistrictsInfo {
    distName[54],
    Float:distPos[6]
}

static const stock cityDistricts[][cityDistrictsInfo] = {
	{"The Big Ear",                												{-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
	{"Aldea Malvada",               											{-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
	{"Angel Pine",                 												{-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
	{"Arco del Oeste",              											{-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
	{"Avispa Country Club",         											{-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
	{"Avispa Country Club",         											{-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
	{"Avispa Country Club",         											{-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
	{"Avispa Country Club",         											{-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
	{"Avispa Country Club",         											{-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
	{"Avispa Country Club",         											{-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
	{"Back o Beyond",               											{-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
	{"Battery Point",               											{-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
	{"Bayside",                     											{-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
	{"Bayside Marina",              											{-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
	{"Beacon Hill",                 											{-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
	{"Blackfield",                 												{964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
	{"Blackfield",                  											{964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
	{"Blackfield Chapel",           											{1375.60,596.30,-89.00,1558.00,823.20,110.90}},
	{"Blackfield Chapel",           											{1325.60,596.30,-89.00,1375.60,795.00,110.90}},
	{"Blackfield Intersection",   												{1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
	{"Blackfield Intersection",     											{1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
	{"Blackfield Intersection",     											{1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
	{"Blackfield Intersection",     											{1375.60,823.20,-89.00,1457.30,919.40,110.90}},
	{"Blueberry",                   											{104.50,-220.10,2.30,349.60,152.20,200.00}},
	{"Blueberry",                   											{19.60,-404.10,3.80,349.60,-220.10,200.00}},
	{"Blueberry Acres",             											{-319.60,-220.10,0.00,104.50,293.30,200.00}},
	{"Caligula's Palace",           											{2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
	{"Caligula's Palace",           											{2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
	{"Calton Heights",              											{-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
	{"Chinatown",                   											{-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
	{"City Hall",                   											{-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
	{"Come-A-Lot",                  											{2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
	{"Commerce",                    											{1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
	{"Commerce",                    											{1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
	{"Commerce",                    											{1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
	{"Commerce",                    											{1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
	{"Commerce",                    											{1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
	{"Commerce",                    											{1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
	{"Conference Center",           											{1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
	{"Conference Center",           											{1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
	{"Cranberry Station",           											{-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
	{"Creek",                       											{2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
	{"Dillimore",                   											{580.70,-674.80,-9.50,861.00,-404.70,200.00}},
	{"Doherty",                     											{-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
	{"Doherty",                     											{-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
	{"Downtown",                    											{-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
	{"Downtown",                    											{-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
	{"Downtown",                    											{-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
	{"Downtown",                    											{-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
	{"Downtown",                    											{-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
	{"Downtown",                    											{-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
	{"Downtown Los Santos",         											{1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
	{"Downtown Los Santos",         											{1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
	{"Downtown Los Santos",         											{1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
	{"Downtown Los Santos",         											{1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
	{"Downtown Los Santos",         											{1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
	{"Downtown Los Santos",         											{1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
	{"Downtown Los Santos",         											{1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
	{"Downtown Los Santos",         											{1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
	{"Downtown Los Santos",         											{1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
	{"East Beach",                  											{2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
	{"East Beach",                  											{2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
	{"East Beach",                  											{2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
	{"East Beach",                  											{2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
	{"East Los Santos",             											{2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
	{"East Los Santos",             											{2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
	{"East Los Santos",             											{2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
	{"East Los Santos",             											{2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
	{"East Los Santos",             											{2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
	{"East Los Santos",             											{2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
	{"East Los Santos",             											{2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
	{"Easter Basin",                											{-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
	{"Easter Basin",                											{-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
	{"Easter Bay Airport",          											{-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
	{"Easter Bay Airport",          											{-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
	{"Easter Bay Airport",          											{-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
	{"Easter Bay Airport",          											{-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
	{"Easter Bay Airport",          											{-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
	{"Easter Bay Airport",          											{-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
	{"Easter Bay Airport",          											{-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
	{"Easter Bay Airport",          											{-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
	{"Easter Bay Chemicals",        											{-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
	{"Easter Bay Chemicals",        											{-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
	{"El Castillo del Diablo",      											{-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
	{"El Castillo del Diablo",      											{-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
	{"El Castillo del Diablo",      											{-208.50,2337.10,0.00,8.40,2487.10,200.00}},
	{"El Corona",                   											{1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
	{"El Corona",                   											{1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
	{"El Quebrados",                											{-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
	{"Esplanade East",              											{-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
	{"Esplanade East",              											{-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
	{"Esplanade East",              											{-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
	{"Esplanade North",             											{-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
	{"Esplanade North",             											{-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
	{"Esplanade North",             											{-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
	{"Fallen Tree",                 											{-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
	{"Fallow Bridge",               											{434.30,366.50,0.00,603.00,555.60,200.00}},
	{"Fern Ridge",                  											{508.10,-139.20,0.00,1306.60,119.50,200.00}},
	{"Financial",                   											{-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
	{"Fisher's Lagoon",             											{1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
	{"Flint Intersection",          											{-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
	{"Flint Range",                 											{-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
	{"Fort Carson",                 											{-376.20,826.30,-3.00,123.70,1220.40,200.00}},
	{"Foster Valley",               											{-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
	{"Foster Valley",               											{-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
	{"Foster Valley",               											{-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
	{"Foster Valley",               											{-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
	{"Frederick Bridge",            											{2759.20,296.50,0.00,2774.20,594.70,200.00}},
	{"Gant Bridge",                 											{-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
	{"Gant Bridge",                 											{-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
	{"Ganton",                      											{2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
	{"Ganton",                      											{2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
	{"Garcia",                      											{-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
	{"Garcia",                      											{-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
	{"Garver Bridge",               											{-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
	{"Garver Bridge",               											{-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
	{"Garver Bridge",               											{-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
	{"Glen Park",                   											{1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
	{"Glen Park",                   											{1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
	{"Glen Park",                   											{1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
	{"Green Palms",                 											{176.50,1305.40,-3.00,338.60,1520.70,200.00}},
	{"Greenglass College",          											{964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
	{"Greenglass College",          											{964.30,930.80,-89.00,1166.50,1044.60,110.90}},
	{"Hampton Barns",               											{603.00,264.30,0.00,761.90,366.50,200.00}},
	{"Hankypanky Point",            											{2576.90,62.10,0.00,2759.20,385.50,200.00}},
	{"Harry Gold Parkway",          											{1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
	{"Hashbury",                    											{-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
	{"Hilltop Farm",                											{967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
	{"Hunter Quarry",               											{337.20,710.80,-115.20,860.50,1031.70,203.70}},
	{"Idlewood",                    											{1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
	{"Idlewood",                    											{1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
	{"Idlewood",                    											{1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
	{"Idlewood",                    											{1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
	{"Idlewood",                    											{2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
	{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
	{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
	{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
	{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
	{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
	{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
	{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
	{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
	{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
	{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
	{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
	{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
	{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
	{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
	{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
	{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
	{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
	{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
	{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
	{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
	{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
	{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
	{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
	{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
	{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
	{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
	{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
	{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
	{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
	{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
	{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
	{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
	{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
	{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
	{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
	{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
	{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
	{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
	{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
	{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
	{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
	{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
	{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
	{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
	{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
	{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
	{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
	{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
	{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
	{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
	{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
	{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
	{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
	{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
	{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
	{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
	{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
	{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
	{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
	{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
	{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
	{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
	{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
	{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
	{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
	{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
	{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
	{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
	{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
	{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
	{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
	{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
	{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
	{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
	{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
	{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
	{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
	{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
	{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
	{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
	{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
	{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
	{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
	{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
	{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
	{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
	{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
	{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
	{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
	{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
	{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
	{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
	{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
	{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
	{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
	{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
	{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
	{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
	{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
	{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
	{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
	{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
	{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
	{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
	{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
	{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
	{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
	{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
	{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
	{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
	{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
	{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
	{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
	{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
	{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
	{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
	{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
	{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
	{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
	{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
	{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
	{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
	{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
	{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
	{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
	{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
	{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
	{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
	{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
	{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
	{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
	{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
	{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
	{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
	{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
	{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
	{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
	{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
	{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
	{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
	{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
	{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
	{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
	{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
	{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
	{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
	{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
	{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
	{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
	{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
	{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
	{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
	{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
	{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
	{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
	{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
	{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
	{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
	{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
	{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
	{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
	{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
	{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
	{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
	{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
	{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
	{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
	{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
	{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
	{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
	{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
	{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
	{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
	{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
	{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
	{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
	{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
	{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
	{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
	{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
	{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
	{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
	{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
	{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
	{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
	{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
	{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
	{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
	{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
	{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
	{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
	{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
	{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
	{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
	{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
	{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
	{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
	{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
	{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
	{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
	{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
	{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
	{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
	{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
	{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
	{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
	{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
	{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
	{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
	{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
	{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
	{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
	{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
	{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
	{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
	{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
	{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
	{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
	{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
	{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};


// jobs
new const Float:busPoints[][3] = {},
	Float:pizzaPoints[][3] = {
		{1228.8202,2584.9231,10.8203},
		{1608.6163,2750.2510,10.8203},
		{1703.6362,2692.5605,10.8203},
		{1992.7838,2760.9783,10.8203},
		{2017.8778,2663.0161,10.8203},
		{2628.8142,2347.7148,10.6719},
		{2794.3611,2262.7261,10.8203},
		{2787.9570,2227.7034,14.6615},
		{2819.4719,2140.7395,10.8203},
		{2372.2632,2165.8560,10.8285},
		{2464.1101,2241.8542,10.8203},
		{2127.7043,2375.9675,10.8203},
		{1367.3596,2006.8068,11.4609},
		{1311.9127,1935.6104,11.4609},
		{1955.1624, 671.5222,14.2732},
		{1922.7615, 740.2113,10.8203},
		{2043.0139, 693.0547,11.4531},
		{2227.4226, 652.5236,11.4609},
		{2448.6462, 712.9528,11.4683},
		{2235.1638,1285.7783,10.8203}
	},
	
	Float:swepperPoints[][3] = {
		{1500.6093,993.0189,10.5143},
		{1511.8910,1129.7114,10.5032},
		{1652.1907,1130.2583,10.4787},
		{1862.8517,1127.9182,10.3969},
		{1880.6477,1090.9913,10.4697},
		{2043.3732,1088.9409,10.3970},
		{2043.2352,855.3023,6.4594},
		{1810.0189,856.9656,10.3970},
		{1809.9445,1057.0927,6.4636},
		{1809.1829,1348.5792,6.4594},
		{1808.8156,1586.4471,6.4587},
		{1809.1271,1740.3557,6.4672},
		{1809.3704,1922.3730,6.0263},
		{1809.6219,2074.1997,3.6390},
		{1808.9545,2285.5471,5.3307},
		{1786.4208,2550.5547,13.6282},
		{1464.6906,2475.1621,6.4671},
		{1213.0863,2318.7180,6.4594},
		{1204.9946,2086.0676,6.4595},
		{1200.7986,1941.6056,6.4596},
		{1134.4308,1817.6809,10.6798},
		{1013.5543,1816.5140,10.4933},
		{1010.0664,1936.2615,10.3970},
		{1074.8282,2051.1284,10.3969},
		{1252.8134,2050.5430,12.1252},
		{1519.0431,2051.1084,10.4365},
		{1531.7535,2167.2910,10.3970},
		{1717.2012,2170.4368,10.4165},
		{1730.5034,2265.8118,10.5379},
		{1922.2789,2269.5361,10.5143},
		{1924.0537,2048.9060,10.4711},
		{1710.4220,2052.6440,10.5849},
		{1701.4373,1878.0784,10.3970},
		{1570.8439,1875.2654,10.5146},
		{1441.8768,1875.3496,10.3971},
		{1329.3148,1871.6226,10.3970},
		{1322.9701,1819.1029,10.3970},
		{1223.4199,1815.3933,13.5301},
		{1010.5524,1814.5784,10.5835},
		{1005.7274,1649.6979,10.4986},
		{1004.9578,1459.5284,10.4057},
		{1005.1486,1311.1824,10.3970},
		{1009.2032,1195.7253,10.3969},
		{1145.2471,1191.2909,10.3970},
		{1323.1897,1190.6489,10.3971},
		{1442.8372,1187.9817,10.3970},
		{1447.6182,1136.4032,10.3970}
	};

enum mafiasZones {
	mID,
	mName[16],
	mX1,
	mY1,
	mX2,
	mY2,
	
}


new const mafiaZones[3][6] = {
	{"Mafia | Стоунхендж",-1348,2486,-1273,2562,0xFF0000FF},
	{"Mafia | Ухо",-406,1506,-277,1627,0xFF0000FF},
	{"Армия | Зона 51",-25,1677,443,2113,0x00FF00FF},
	//{"Армия | К.А.С.С.",,0x00FF00FF}
};

new playerVariable[MAX_PLAYERS][playerVariables];
new adminVariable[MAX_PLAYERS][adminVariables];
new organizationVariable[MAX_ORGANIZATIONS][organizationVariables] = {
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false},
    {0,"None","","","","","","","","","","", {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,false}
};
new jobVariable[MAX_JOBS][jobVariables];
new familyVariable[MAX_PLAYERS][familyVariables];
new houseVariable[MAX_PLAYERS][houseVariables];
new buisnessVariable[MAX_PLAYERS][buisnessVariables];
new vehicleVariable[MAX_VEHICLES][vehicleVariables];
new adminSystemVariable[MAX_ADMIN_RANK][adminSystemVariables];
new inventoryVariable[MAX_PLAYERS][inventoryVariables];
new trashcanVariable[MAX_TRASHCANS][trashcanVariables];
new actorVariable[MAX_PERSONS][actorVariables];
new gangVariable[MAX_GANGZONES][gangVariables];
new tdSpeedometerVariable[MAX_PLAYERS][tdSpeedometerVariables];

////////////////////////////////////////////////////////////////////////////////

// M Y   S Q L

////////////////////////////////////////////////////////////////////////////////

new MySQL:DATABASE,
    ServerName[32],
	ServerSite[32],
	ServerLangue[11],
	ServerNum[5],
	ServerClient[7],
	ServerMap[11];

new dbTables[21] = {
	// player
	"accounts", 																// все аккаунты 				| +
	"admins", 																	// все админы   				| -

	"organization", 															// все сотрудники организаций   |
	"job", 																		// все работяги                 |
	"family",                                                                   // все семьи                    |
	
	"buisness",                                                                 // все бизнесы игроков          |
	"house", 																	// все дома игроков             |
	"vehicle", 																	// весь транспорт игроков/семей |
	"hotel", 																	// все номера игроков           |
	
	"bank", 																	// банк всех игроковq           | -
	"phone", 																	// все телефоны и симки игроков | -
	"licenses",                                                                 // все лицензии игроков         | +
	"skills", 																	// скиллы и навыки игроков      | +
	
	"inventory",																// весь инвентарь игроков       | +
	"punishs", 																	// все наказания игроков        |
	"settings",																	// настройки всех игрков        | +
	"other",																	// другое                       | +
	"notes", 																	// все заметки игроков          | +
	
	// other
	"organizations", // вся инфа о орг
	"jobs", // вся инфа о работах
	"families", // вся инфа о семьях
	"vehicles", // все статические авто
	"houses", // вся инфа о домах
	"buisnesses", // вся инфа о бизнесах
	"hotels" // вся инфа об отелях
};

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

//		T		R		A		N		S		P		O		R		T

////////////////////////////////////////////////////////////////////////////////

new vehGovern[10];
new vehFBI[19];
new vehPolice[25];
new vehArmy[21];
new vehHospital[10];
new vehNews[10];
new vehDriveSchool[20];

new vehMafia1[10];
new vehMafia2[10];
new vehMafia3[10];
new vehMafia4[10];
new vehMafia5[10];

new vehBus[6];
new vehTaxi[6];
new vehMechanic[10];
new vehTrashmaster[6][truckVariables];
new vehSwepper[6];
new VehPizzaboy[10];
new VehDelivery[10];
new VehTruck[10];
new VehCollector[10];
new VehFireTruck[6][truckVariables];
new VehUtilityVan[6];

new VehRentCheap[10];
new VehRentMedium[10];
new VehRentExpensive[10];

new VehKarts[10];
new vehScooters[48];

new VehFinePark[MAX_VEHICLES];
new VehCarpool[30];

new VehCheapDealership[10];
new VehMiddleDealership[10];
new VehExpensiveDealership[10];

////////////////////////////////////////////////////////////////////////////////

// P R I C E S

////////////////////////////////////////////////////////////////////////////////

#define FUEL_IN_CAR                                                             60
#define FUEL_IN_CANISTER                                                        20

#define PRICE_TICKET_BUS                                                        500
#define PRICE_1KM_TAXI                                                          250
#define PRICE_1KG_TRASH                                                         400
#define PRICE_1_PIZZA                                                           350
#define PRICE_1_COLLECTOR                                                       2500

#define PRICE_ORG_FRENCH_FRIES                                                  500
#define PRICE_ORG_BURGER                                                        750
#define PRICE_ORG_PIZZA                                                         1000

#define PRICE_HEAL                                                              2000
#define PRICE_CURE_DRUG_ADDICTION                                               5000
#define PRICE_CHANGESEX                                                         30000
#define PRICE_MEDCARD                                                           1000

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

// O T H E R

////////////////////////////////////////////////////////////////////////////////

new bool:onCheckpoint[MAX_PLAYERS][10];
new PlayerText:PreviewIcon[MAX_PLAYERS];
new gangZones[1000];
new zone1,zone2,zone3;
new PICKUPS[1000];
new rows = 0,
	string[256],
	query[256];
new Cache:cache;

#define DISTANCE_BETWEEN_PLAYERS                                                5.0
#define DISTANCE_BETWEEN_ACTION                                                 2.0

new string_ORG_FOOD[64] = "1. Картошка фри\n2. Бургер\n3. Пицца";

#define FORM_PUT																"Вы действительно хотите одеть рабочую форму?"
#define FORM_OUTPUT																"Вы действительно хотите снять рабочую форму?"

new Text:SBox;
new Text:SBox1;
new PlayerText:CarSpeed[MAX_PLAYERS];
new PlayerText:CarFuel[MAX_PLAYERS];
new PlayerText:CarMilliage[MAX_PLAYERS];
new PlayerText:CarLights[MAX_PLAYERS];
new PlayerText:CarEngine[MAX_PLAYERS];
new SpeedTimer[MAX_PLAYERS];

new reportMessages[MAX_PLAYERS][128];
new reportTimers[MAX_PLAYERS];

new newsAds[16][64];

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

// F U N C T I O N S

////////////////////////////////////////////////////////////////////////////////

static stock Debugging(const msg[],playerid_,got_rows,expected_rows) {
	printf("\n");
	if(playerid_ != -1) printf("ERROR : playerid = %i",playerid_);
	printf("ERROR : %s",msg);
	if(got_rows != 0 || expected_rows != 0) { printf("ERROR : %s : got rows = %i : expected rows = %i",msg,got_rows,expected_rows); }
	printf("\n\n");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock Logging(const msg[]) {
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock Warning(playerid, const command[], const description[]) {
	new currDate[32],currTime[32];
	format(currDate,sizeof(currDate),"%s",GetNowDate());
	format(currTime,sizeof(currTime),"%s",GetNowTime());
	format(query,sizeof(query),"INSERT INTO `Errors` (`Date`, `Time`, `PlayerID`, `Command`, `Description`) VALUES ('%s', '%s', '%i', '%s', '%s')",
	currDate,currTime,playerVariable[playerid][pID],command,description);
	mysql_tquery(MySQL:DATABASE,query);
	
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock ClearQuery() {
	rows = 0;
	query[0] = EOS;
}

////////////////////////////////////////////////////////////////////////////////

static stock ConnectMySQL() {
    mysql_connect(SQL_HOST,SQL_USER,SQL_DB,SQL_PASS);
    switch(mysql_ping() {
    	case 1: print("MySQL connected.");
     	case -1: print("MySQL did not connect.");
    }
   	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DisconnectMySQL() {
	mysql_close();
    print("MySQL connection closed.");
}

////////////////////////////////////////////////////////////////////////////////

static stock CheckMySQLConnection() {
    if(mysql_ping() == -1) mysql_reconnect();
    print("MySQL reconnecting..");
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CreateAccount(playerid,password[]) {
    ClearQuery();
	
	print("CreateAccount - Начало создания аккаунта..");
    new RegIP[16];
	GetPlayerIp(playerid,RegIP,16);
	
    format(query,sizeof(query),"INSERT INTO `account` (`NickName`, `Password`, `RegIP`, `Cash`) VALUES ('%s', '%s', '%s', '%i')",
	playerVariable[playerid][pName],password,RegIP,1000 + random(2000));
    mysql_tquery(MySQL:DATABASE,query);
	
    print("CreateAccount - Аккаунт добавлен в БД");
    format(query,sizeof(query),"SELECT * FROM `account` WHERE `NickName` = '%s' AND `Password` = '%s' LIMIT 1",playerVariable[playerid][pName],password);
    mysql_query(MySQL:DATABASE,query);
    
    if(cache_get_row_count(rows)) {
		if(rows == 1) {
		    cache_get_value_name_int(0,"ID",playerVariable[playerid][pID]);
		} else { Debugging("CreateAccount",playerid,rows,1); print("CreateAccount - Аккаунт не найден!"); return 1; }
    } else { Debugging("CreateAccount : cache",playerid,0,0); print("CreateAccount - Запрос не выполнен!"); return 1; }
    
    format(query,sizeof(query),"INSERT INTO `inventory` (`ID`, `NickName`) VALUES ('%i', '%s')",playerVariable[playerid][pID],playerVariable[playerid][pName]);
	mysql_tquery(MySQL:DATABASE,query);
	
    LoadPlayerVariables(playerid);
    playerVariable[playerid][pLogged] = true;
    PreparePlayer(playerid);
    
    print("CreateAccount - Аккаунт создан!");
    print("CreateAccount - Игрок авторизован");
    SCM(playerid,WHITE,!"Вы успешно зарегестрировались!");
    
    format(string,sizeof(string),"%s Зарегестрирован новый аккаунт %s[%i] | IP: %s | Ping: %i",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,RegIP,GetPlayerPing(playerid));
	SendAdminChat(playerid,WHITE,string);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadAccount(playerid,password[]) {
    ClearQuery();
    
	print("LoadAccount - Начало загрузки аккаунта..");
	
	printf("%i %s %s",playerVariable[playerid][pID],playerVariable[playerid][pName],password);
    format(query,sizeof(query),"SELECT * FROM `account` WHERE `ID` = '%i' AND `NickName` = '%s' AND `Password` = '%s' LIMIT 1",
	playerVariable[playerid][pID],playerVariable[playerid][pName],password);
 	mysql_query(MySQL:DATABASE,query);
 	
    print("LoadAccount - Запрос обработан");
    
	if(cache_get_row_count(rows)) {
		if(rows == 1) {
		    print("LoadAccount - Аккаунт найден!");
		    GetPlayerIp(playerid,playerVariable[playerid][pNowIP],17);
	        LoadPlayerVariables(playerid);
	        playerVariable[playerid][pLogged] = true;

	        if(playerVariable[playerid][pAdmin]>0) {
    			ClearQuery();
			    format(query,sizeof(query),"SELECT * FROM `admins` WHERE `ID` = '%i' AND NickName` = '%s' LIMIT 1",playerVariable[playerid][pID],playerVariable[playerid][pName]);
			    mysql_query(MySQL:DATABASE,query);
			    if(cache_get_row_count(rows)) {
					if(rows == 1) { LoadAdminVariables(playerid); printf("1416 %s",adminVariable[playerid][aPassword]); }
					else { return Debugging("LoadAccountAdmin",playerid,rows,1); }
			    } else { return Debugging("LoadAccountAdmin : cache",playerid,0,0); }
			}
			PreparePlayer(playerid);

	        print("LoadAccount - Игрок авторизован");
	        SCM(playerid,WHITE,!"Вы успешно авторизовались!");
	        SCM(playerid,WHITE,!"Приятной игры на Mafia Role Play!");
	        
	    } else { Debugging("LoadAccount",playerid,rows,1); print("LoadAccount - Аккаунт не найден!"); return 1; }
	} else { Debugging("LoadAccount : cache",playerid,0,0); print("LoadAccount - Запрос не выполнен!!"); return 1; }
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SaveAccount(playerid) {
	print("SaveAccount - Начало сохранения аккаунта..");
    if(playerVariable[playerid][pLogged]==true) {
        //GetPlayerHealth(playerid,playerVariable[playerid][pHeal]);
        //GetPlayerArmour(playerid,playerVariable[playerid][pArmour]);
        
        new guns[13][2];
        for(new i;i<13;++i) GetPlayerWeaponData(playerid,i,guns[i][0],guns[i][1]);
        
        print("SaveAccount - Игрок авторизован");
        
        format(query,sizeof(query),"UPDATE `account` SET `Heal` = '%i', `Armour` = '%i', `Satiety` = '%i', `PlayedTime` = `PlayedTime` + '%i', `Guns` = '%s' WHERE `ID` = '%i'",
		playerVariable[playerid][pHeal],playerVariable[playerid][pArmour],playerVariable[playerid][pSatiety],playerVariable[playerid][pPlayedTime],
		guns,playerVariable[playerid][pID]);
		mysql_tquery(MySQL:DATABASE,query);
        print("SaveAccount - Запрос на сохранения отправлен");
    }
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock RemovePlayerVariables(playerid) {
	print("RemovePlayerVariables - Начало удаления переменных..");
 	playerVariable[playerid][pID] = 0;
    playerVariable[playerid][pWrongPassword] = 0;
    playerVariable[playerid][pLogged] = false;
	print("RemovePlayerVariables - Переменные удалены");
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock RemoveAdminVariables(playerid) {
	print("RemoveAdminVariables - Начало удаления переменных..");
	adminVariable[playerid][aID] = 0;
	adminVariable[playerid][aWrongPassword] = 0;
	adminVariable[playerid][aLogged] = false;
	print("RemoveAdminVariables - Переменные удалены");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CheckAccount(playerid) {
    ClearQuery();
	
	print("CheckAccount - Начало получения глобального ИД игрока по нику..");
	printf("CheckAccount - Ник игрока - %s",playerVariable[playerid][pName]);
	
    format(query,sizeof(query),"SELECT `ID`, `Admin` FROM `account` WHERE `NickName` = '%s' LIMIT 1",playerVariable[playerid][pName]);
    mysql_query(MySQL:DATABASE,query);
    
    print("CheckAccount - Запрос отправлен");
    if(cache_get_row_count(rows)) {
        if(rows == 1) {
		    cache_get_value_name_int(0,"ID",playerVariable[playerid][pID]);
		    cache_get_value_name_int(0,"Admin",playerVariable[playerid][pAdmin]);
	        printf("CheckAccount - Игрок получил свой глобальный ИД");
	        return playerVariable[playerid][pID];
		} else { Debugging("CheckAccount",playerid,rows,1); }
    } else { Debugging("CheckAccount : cache",playerid,0,0); }
    
	playerVariable[playerid][pID] = 0;
    print("CheckAccount - Аккаунт не найден!");
    return 0;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetPlayerIDFromName(nameID[]) {
    foreach(new i:Player) {
        if(!IsPlayerConnected(i)) continue;
        new NickName[MAX_PLAYER_NAME + 1];
        GetPlayerName(i,NickName,sizeof(NickName));
        if(strcmp(NickName,nameID,false)==0) return i;
    }
    return INVALID_PLAYER_ID;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadPlayerVariables(playerid) {
	new temp = GetTickCount();
	print("LoadVariables - Начало активации переменных..");
    cache_get_value_name_int(0,"ID",playerVariable[playerid][pID]);
    cache_get_value_name(0,"NickName",playerVariable[playerid][pName],24);
    //cache_get_value_name(0,"Password",playerVariable[playerid][pPassword],32);
    //cache_get_value_name(0,"RegIP",playerVariable[playerid][pRegIP],16);
    //cache_get_value_name(0,"Mail",playerVariable[playerid][pMail],32);
    cache_get_value_name_int(0,"Admin",playerVariable[playerid][pAdmin]);
    cache_get_value_name_int(0,"EXP",playerVariable[playerid][pEXP]);
	//new LVLandEXP[2] = GetLVLFromEXP(playerVariable[playerid][pEXP]);
    //playerVariable[playerid][pLVL] = LVLandEXP[0];
    //playerVariable[playerid][pEXP] = LVLandEXP[1];
    //cache_get_value_name_int(0,"LVL",playerVariable[playerid][pLVL]);
    cache_get_value_name_int(0,"Cash",playerVariable[playerid][pCash]);
    //cache_get_value_name(0,"ColorName",playerVariable[playerid][pColorName],7);
    cache_get_value_name(0,"Sex",playerVariable[playerid][pSex],8);
    cache_get_value_name(0,"SkinColor",playerVariable[playerid][pSkinColor],8);
    //cache_get_value_name_int(0,"Skin",playerVariable[playerid][pSkinID]);
    cache_get_value_name_int(0,"SpawnPoint",playerVariable[playerid][pSpawnPlace]);
    cache_get_value_name(0,"PhoneNumber",playerVariable[playerid][pPhoneNumber],12);
    cache_get_value_name_float(0,"Heal",playerVariable[playerid][pHeal]);
    cache_get_value_name_float(0,"Armour",playerVariable[playerid][pArmour]);
    cache_get_value_name_float(0,"Satiety",playerVariable[playerid][pSatiety]);
    cache_get_value_name_int(0,"Fine",playerVariable[playerid][pFine]);
    cache_get_value_name_int(0,"OrgID",playerVariable[playerid][pOrgID]);
    cache_get_value_name_int(0,"Rank",playerVariable[playerid][pOrgRank]);
    cache_get_value_name_int(0,"JobID",playerVariable[playerid][pJobID]),
    cache_get_value_name(0,"Spouse",playerVariable[playerid][pSpouse],24);
    cache_get_value_name_int(0,"SkillSDPistol",playerVariable[playerid][pSkillSDPistol]);
    cache_get_value_name_int(0,"SkillDesertEagle",playerVariable[playerid][pSkillDesertEagle]);
    cache_get_value_name_int(0,"SkillM4A1",playerVariable[playerid][pSkillM4A1]);
    cache_get_value_name_int(0,"SkillAK47",playerVariable[playerid][pSkillAK47]);
    cache_get_value_name_int(0,"SkillShotGun",playerVariable[playerid][pSkillShotgun]);
    cache_get_value_name_int(0,"SkillMP5",playerVariable[playerid][pSkillMP5]);
    cache_get_value_name_int(0,"SkillUZI",playerVariable[playerid][pSkillUZI]);
    cache_get_value_name_int(0,"SkillSniper",playerVariable[playerid][pSkillSniper]);
    cache_get_value_name(0,"LicAuto",playerVariable[playerid][pLicAuto],12);
    cache_get_value_name(0,"LicShip",playerVariable[playerid][pLicShip],12);
    cache_get_value_name(0,"LicAir",playerVariable[playerid][pLicAir],12);
    cache_get_value_name(0,"LicMoto",playerVariable[playerid][pLicMoto],12);
    cache_get_value_name(0,"LicGun",playerVariable[playerid][pLicGun],12);
    cache_get_value_name(0,"Medcard",playerVariable[playerid][pMedcard],12);
    cache_get_value_name_int(0,"Law",playerVariable[playerid][pLaw]);
    cache_get_value_name_bool(0,"BankHaveCard",playerVariable[playerid][pBankCard]);
    cache_get_value_name(0,"BankPassword",playerVariable[playerid][pBankPassword],12);
    cache_get_value_name_int(0,"BankCash",playerVariable[playerid][pBankCash]);
    cache_get_value_name_int(0,"BankDeposit",playerVariable[playerid][pBankDeposit]);
    cache_get_value_name_int(0,"Charity",playerVariable[playerid][pBankCharity]);
    cache_get_value_name(0,"Status",playerVariable[playerid][pStatus],12);
    cache_get_value_name_int(0,"Donat",playerVariable[playerid][pDonat]);
    cache_get_value_name_int(0,"Quests",playerVariable[playerid][pQuests]);
    cache_get_value_name(0,"Guns",playerVariable[playerid][pGuns],56);
    cache_get_value_name_int(0,"PlayedTime",playerVariable[playerid][pPlayedTime]);
    cache_get_value_name_int(0,"WhereKnew",playerVariable[playerid][pWhereKnew]);
    cache_get_value_name_bool(0,"SettingsAdminAction",playerVariable[playerid][pSettingsAdminAction]);
    cache_get_value_name_bool(0,"SettingsAdd",playerVariable[playerid][pSettingsAdds]);
    cache_get_value_name_bool(0,"SettingsBroadcast",playerVariable[playerid][pSettingsBroadcast]);
    cache_get_value_name_bool(0,"SettingsOrgChat",playerVariable[playerid][pSettingsOrgChat]);
    cache_get_value_name_bool(0,"SettingsOrgFam",playerVariable[playerid][pSettingsFamChat]);
    cache_get_value_name_bool(0,"SettingsJobChat",playerVariable[playerid][pSettingsJobChat]);
    cache_get_value_name_int(0,"FamID",playerVariable[playerid][pFamID]);
    cache_get_value_name_int(0,"FamRank",playerVariable[playerid][pFamRank]);
    print("LoadVariables - Переменные загружены.");
    printf("Загрузка аккаунта: <%i> сек",GetTickCount()-temp);
    //LoadPlayerVariables2(playerid);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadAdminVariables(playerid) {
	cache_get_value_name_int(0,"ID",adminVariable[playerid][aID]);
	cache_get_value_name(0,"NickName",adminVariable[playerid][aName],24);
	cache_get_value_name(0,"Password",adminVariable[playerid][aPassword],32);
	cache_get_value_name_int(0,"LVL",adminVariable[playerid][aLVL]);
	cache_get_value_name(0,"NameRank",adminVariable[playerid][aNameRank],24);
	cache_get_value_name_int(0,"Rating",adminVariable[playerid][aRating]);
	cache_get_value_name_int(0,"CountBan",adminVariable[playerid][aCountBan]);
	cache_get_value_name_int(0,"CountWarn",adminVariable[playerid][aCountWarn]);
	cache_get_value_name_int(0,"CountJail",adminVariable[playerid][aCountJail]);
	cache_get_value_name_int(0,"CountMute",adminVariable[playerid][aCountMute]);
	cache_get_value_name_int(0,"CountKick",adminVariable[playerid][aCountKick]);
	cache_get_value_name_int(0,"CountReport",adminVariable[playerid][aCountReport]);
}

////////////////////////////////////////////////////////////////////////////////

static stock PreparePlayer(playerid) {
	SetPlayerScore(playerid,GetLVLFromEXP(playerVariable[playerid][pEXP]));
	GivePlayerMoney(playerid,playerVariable[playerid][pCash]);
	SetPlayerHealth(playerid,playerVariable[playerid][pHeal]);
	SetPlayerArmour(playerid,playerVariable[playerid][pArmour]);
	SetPlayerColor(playerid,FindPlayerColor(playerid));
	//if(playerVariable[playerid][pOrgWorking]==true) SetPlayerSkin(playerid,OrgSkin[playerVariable[playerid][pOrgID]][1]);
	//else SetPlayerSkin(playerid,inventoryVariable[playerid][iCurrSkin]);
	SetPlayerFightingStyle(playerid,playerVariable[playerid][pStyleFight]);
	
}

static stock LoadPlayerVariables2(playerid) {
	new temp = GetTickCount();
	DB_player_accounts(playerid);
	DB_player_organization(playerid);
	DB_player_job(playerid);
	DB_player_bank(playerid);
	DB_player_phone(playerid);
	DB_player_settings(playerid);
	printf("LoadPlayerVariables2 - <%i> ms",GetTickCount()-temp);
}

static stock DB_player_accounts(playerid) {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_accounts` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
		if(rows == 1) {
	        cache_get_value_name_int(0,"ID",playerVariable[playerid][pID]);
	        cache_get_value_name(0,"NickName",playerVariable[playerid][pName],24);
	        cache_get_value_name(0,"Admin",playerVariable[playerid][pAdmin]);
	        cache_get_value_name(0,"EXP",playerVariable[playerid][pEXP]);
	        cache_get_value_name(0,"Cash",playerVariable[playerid][pCash]);
	        cache_get_value_name_bool(0,"Sex",playerVariable[playerid][pSex]);
	        cache_get_value_name_bool(0,"SkinColor",playerVariable[playerid][pSkinColor]);
	        cache_get_value_name(0,"SpawnPlace",playerVariable[playerid][pSpawnPlace]);
	        cache_get_value_name(0,"Heal",playerVariable[playerid][pHeal]);
	        cache_get_value_name(0,"Armour",playerVariable[playerid][pArmour]);
	        cache_get_value_name(0,"Satiety",playerVariable[playerid][pSatiety]);
		} else { Debugging("player_accounts",got_rows=rows,expected_rows=1); }
	} else { Debugging("player_accounts | cache - 0",playerid=playerid); }
	return 1;
}

static stock DB_player_admin(playerid) {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_admin` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows == 1)
	{
	 	cache_get_value_name_int(0,"ID",adminVariable[playerid][aID]);
		cache_get_value_name(0,"NickName",adminVariable[playerid][aName],24);
		cache_get_value_name(0,"Password",adminVariable[playerid][aPassword],32);
		cache_get_value_name_int(0,"LVL",adminVariable[playerid][aLVL]);
		cache_get_value_name(0,"NameRank",adminVariable[playerid][aNameRank],24);
		cache_get_value_name_int(0,"Rating",adminVariable[playerid][aRating]);
		cache_get_value_name_int(0,"CountBan",adminVariable[playerid][aCountBan]);
		cache_get_value_name_int(0,"CountWarn",adminVariable[playerid][aCountWarn]);
		cache_get_value_name_int(0,"CountJail",adminVariable[playerid][aCountJail]);
		cache_get_value_name_int(0,"CountMute",adminVariable[playerid][aCountMute]);
		cache_get_value_name_int(0,"CountKick",adminVariable[playerid][aCountKick]);
		cache_get_value_name_int(0,"CountReport",adminVariable[playerid][aCountReport]);
	}
	else
	{
	    Debugging(playerid,"player_admin",rows,1);
	}
	return 1;
}

static stock DB_player_job(playerid) {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_job` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows==1)
	{
		cache_get_value_name_int(0,"JobID",playerVariable[playerid][pJobID]);
		cache_get_value_name_int(0,"JobRank",playerVariable[playerid][pJobRank]);
		playerVariable[playerid][pJobWorking] = false;
	}
	else
	{
		Debugging(playerid,"player_job",rows,1);
	}
	return 1;
}

static stock DB_player_organization(playerid) {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_organization` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
		if(rows==1) {
	        cache_get_value_name_int(0,"OrgID",playerVariable[playerid][pOrgID]);
	        cache_get_value_name_int(0,"OrgRank",playerVariable[playerid][pOrgRank]);
	        cache_get_value_name_int(0,"OrgReprimands",playerVariable[playerid][pOrgReprimands]);
		} else { Debugging(playerid,"player_organization",rows,1); }
	} else { Debugging(playerid,"player_organization : cache"); }
	return 1;
}

static stock DB_player_phone(playerid) {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_phone` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows == 1)
	{
		cache_get_value_name_bool(0,"Phone",playerVariable[playerid][pPhone]);
		cache_get_value_name_int(0,"CardNumber",playerVariable[playerid][pPhoneNumber]);
		cache_get_value_name_int(0,"PhoneBalance",playerVariable[playerid][pPhoneBalance]);
		cache_get_value_name_int(0,"PhoneIsOn",playerVariable[playerid][pPhoneIsOn]);
	}
	else
	{
	    Debugging(playerid,"player_phone",rows,1);
	}
	return 1;
}

static stock DB_player_bank(playerid)
{
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_bank` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows==1)
 	{
        cache_get_value_name_bool(0,"BankCard",playerVariable[playerid][pBankCard]);
        cache_get_value_name(0,"BankPassword",playerVariable[playerid][pBankPassword]);
        cache_get_value_name_int(0,"BankCash",playerVariable[playerid][pBankCash]);
        cache_get_value_name_int(0,"BankDeposit",playerVariable[playerid][pBankDeposit]);
        cache_get_value_name_int(0,"BankCharity",playerVariable[playerid][pBankCharity]);
	}
	else
	{
		Debugging(playerid,"player_bank",0,rows,1);
	}
	return 1;
}

static stock DB_player_licenses(playerid)
{
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_licenses` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows == 1)
	{
        cache_get_value_name_int(0,"LicAuto",playerVariable[playerid][pLicAuto]);
        cache_get_value_name_int(0,"LicShip",playerVariable[playerid][pLicShip]);
        cache_get_value_name_int(0,"LicAir",playerVariable[playerid][pLicAir]);
        cache_get_value_name_int(0,"LicMoto",playerVariable[playerid][pLicMoto]);
        cache_get_value_name_int(0,"LicGun",playerVariable[playerid][pLicGun]);
        cache_get_value_name_int(0,"Medcard",playerVariable[playerid][pMedcard]);
	}
	else
	{
		Debugging(playerid,"player_licenses",0,rows,1);
	}
	return 1;
}

static stock DB_player_skills(playerid)
{
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_skills` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows == 1)
	{
        cache_get_value_name_int(0,"LicAuto",playerVariable[playerid][pLicAuto]);
        cache_get_value_name_int(0,"LicShip",playerVariable[playerid][pLicShip]);
        cache_get_value_name_int(0,"LicAir",playerVariable[playerid][pLicAir]);
        cache_get_value_name_int(0,"LicMoto",playerVariable[playerid][pLicMoto]);
        cache_get_value_name_int(0,"LicGun",playerVariable[playerid][pLicGun]);
        cache_get_value_name_int(0,"Medcard",playerVariable[playerid][pMedcard]);
	}
	else
	{
		Debugging("player_skills",rows,1);
	}
	return 1;
}

static stock DB_player_settings(playerid)
{
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `player_settings` WHERE `ID` = '%i' LIMIT 1",playerVariable[playerid][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	cache_get_row_count(rows);
	if(rows == 1)
	{
        cache_get_value_name_bool(0,"AdminAction",playerVariable[playerid][pSettingsAdminAction]);
        cache_get_value_name_bool(0,"Adds",playerVariable[playerid][pSettingsAdds]);
        cache_get_value_name_bool(0,"Broadcast",playerVariable[playerid][pSettingsBroadcast]);
        cache_get_value_name_bool(0,"OrgChat",playerVariable[playerid][pSettingsOrgChat]);
        cache_get_value_name_bool(0,"JobChat",playerVariable[playerid][pSettingsJobChat]);
        cache_get_value_name_bool(0,"FamChat",playerVariable[playerid][pSettingsFamChat]);
	}
	else
	{
	    Debugging("function: player_settings",playerid=playerid,got_rows=rows,expected_rows=1);
	}
	return 1;
}


static stock FindPlayerColor(playerid) {
    if(8<=playerVariable[playerid][pOrgID]<=12) {
		return orgColors[playerVariable[playerid][pOrgID]];
	} else {
		if(playerVariable[playerid][pSpawnPlace]==3) {
			return orgColors[playerVariable[playerid][pOrgID]];
		} else {
			return COLOR_NONE;
		}
	}
}


enum enum10int {
	int1,
	int2,
	int3,
	int4,
	int5,
	int6,
	int7,
	int8,
	int9,
	int10
}

enum enum10str {
	str1[32],
	str2[32],
	str3[32],
	str4[32],
	str5[32],
	str6[32],
	str7[32],
	str8[32],
	str9[32],
	str10[32]
}


enum enumOrganizations {
	orgID,
	orgName[32],
	_orgRanks[10],
	orgSkinM[10],
	orgSkinF[10],
	_orgSalary[10]
	//enum10str,
	//enum10int,
	//enum10int
}

//new ORGANIZATIONS[12][enumOrganizations];

////////////////////////////////////////////////////////////////////////////////

static stock LoadAdminSystem() {
    ClearQuery();
    format(query,sizeof(query),"SELECT * FROM `admin_system`");
    cache = mysql_query(MySQL:DATABASE,query);
    if(cache_get_row_count(rows)) {
		if(rows == 8) {
			for(new i = 0; i < rows; ++i) {
			    cache_get_value_name_int(i,"ID",adminSystemVariable[i][aID]);
				cache_get_value_name(i,"Name",adminSystemVariable[i][aName],32);
			}
		} else {
			Debugging("admin system : rows",0,rows,8);
		}
	} else {
		Debugging("admin system : cache",0,0,0);
	}
	cache_delete(cache);
	return 1;
}

static stock LoadOrganizations() {
    ClearQuery();
	format(query,sizeof(query),"SELECT * FROM `organizations`");
	cache = mysql_query(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
		if(rows == 12) {
		    for(new i = 0; i < rows; ++i) {
				new tempID,tempName[32],tempRankName1[32],tempRankName2[32],tempRankName3[32],tempRankName4[32],tempRankName5[32],
				tempRankName6[32],tempRankName7[32],tempRankName8[32],tempRankName9[32],tempRankName10[32];
				new tempSkinM1,tempSkinM2,tempSkinM3,tempSkinM4,tempSkinM5,tempSkinM6,tempSkinM7,tempSkinM8,tempSkinM9,tempSkinM10;
				new tempSkinF1,tempSkinF2,tempSkinF3,tempSkinF4,tempSkinF5,tempSkinF6,tempSkinF7,tempSkinF8,tempSkinF9,tempSkinF10;
				new tempSalary1,tempSalary2,tempSalary3,tempSalary4,tempSalary5,tempSalary6,tempSalary7,tempSalary8,tempSalary9,tempSalary10;

				cache_get_value_name_int(i,"ID",tempID);
				cache_get_value_name(i,"Name",tempName,sizeof(tempName));
				cache_get_value_name(i,"RankName1",tempRankName1,sizeof(tempRankName1));
				cache_get_value_name(i,"RankName2",tempRankName2,sizeof(tempRankName2));
				cache_get_value_name(i,"RankName3",tempRankName3,sizeof(tempRankName3));
				cache_get_value_name(i,"RankName4",tempRankName4,sizeof(tempRankName4));
				cache_get_value_name(i,"RankName5",tempRankName5,sizeof(tempRankName5));
				cache_get_value_name(i,"RankName6",tempRankName6,sizeof(tempRankName6));
				cache_get_value_name(i,"RankName7",tempRankName7,sizeof(tempRankName7));
				cache_get_value_name(i,"RankName8",tempRankName8,sizeof(tempRankName8));
				cache_get_value_name(i,"RankName9",tempRankName9,sizeof(tempRankName9));
				cache_get_value_name(i,"RankName10",tempRankName10,sizeof(tempRankName10));

				cache_get_value_name_int(i,"",tempSkinM1);

				organizationVariable[i][oID] = tempID;
			}
		} else { Debugging("organizations : rows",rows,12); }
	} else { Debugging("organizations | cache",0,0,0); }
	cache_delete(cache);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadStaticVehicles() {
	/*ClearQuery();
	mysql_query(MySQL:DATABASE,"SELECT * FROM `vehicles`");
	if(cache_get_row_count(rows)) {
		printf("%i",rows);
		if(rows != 0) {
			for(new i = 0; i < rows; ++i) {
			    new modelID,Float:posX,Float:posY,Float:posZ,Float:angle,color1,color2,timer;
			    cache_get_value_name_int(i,"IDmodel",modelID);
			    cache_get_value_name_float(i,"PosX",posX);
			    cache_get_value_name_float(i,"PosY",posY);
			    cache_get_value_name_float(i,"PosZ",posZ);
			    cache_get_value_name_float(i,"Angle",angle);
			    cache_get_value_name_int(i,"Color1",color1);
			    cache_get_value_name_int(i,"Color2",color2);
			    cache_get_value_name_int(i,"Timer",timer);
			    printf("%i %f %f %f %f %i %i %i",modelID,posX,posY,posZ,angle,color1,color2,timer);
				new carID = ASVex(modelID,posX,posY,posZ,angle,color1,color2,timer);
				GetVehiclePos(carID,posX,posY,posZ);
				printf("carID = %i %f %f %f",carID,posX,posY,posZ);
				if(0<=carID<=10) continue;
			}
		} else { Debugging("vehicles : rows",0,0,123456); }
	} else { Debugging("vehicles : cache",0,0,0); }*/

	// govern
	vehGovern[0] = ASVex(409,981.8,1084.0570,10.8,270.0,1,1,600);
	vehGovern[1] = ASVex(409,981.8,1080.2649,10.8,270.0,1,1,600);
	vehGovern[2] = ASVex(405,981.45,1070.4845,10.8,270.0,1,1,600);
	vehGovern[3] = ASVex(405,981.45,1074.7042,10.8,270.0,1,1,600);
	vehGovern[4] = ASVex(579,982.2,1101.7059,10.8,270.0,1,1,600);
	vehGovern[5] = ASVex(579,982.2,1105.9347,10.8,270.0,1,1,600);
	vehGovern[6] = ASVex(580,981.82,1111.5883,10.8,270.0,1,1,600);
	vehGovern[7] = ASVex(580,981.82,1116.2754,10.8,270.0,1,1,600);
	vehGovern[8] = ASVex(487,1094.0,982.0,27.1,10.0,1,1,600);
	vehGovern[9] = ASVex(487,1112.0,987.0,27.1,27.0,1,1,600);

	// fbi
	vehFBI[0] = ASVex(490,2542.15,2381.7017,4.3386,90.0,0,0,600);
	vehFBI[1] = ASVex(490,2542.15,2377.2114,4.3387,90.0,0,0,600);
	vehFBI[2] = ASVex(490,2542.15,2372.4856,4.3394,90.0,0,0,600);
	vehFBI[3] = ASVex(490,2542.15,2367.9807,4.3384,90.0,0,0,600);
	vehFBI[4] = ASVex(490,2542.15,2363.2751,4.3383,90.0,0,0,600);
	vehFBI[5] = ASVex(560,2515.3,2363.4065,3.9237,90.0,0,0,600);
	vehFBI[6] = ASVex(560,2515.3,2368.2422,3.9232,90.0,0,0,600);
	vehFBI[7] = ASVex(560,2515.3,2372.9734,3.9162,90.0,0,0,600);
	vehFBI[8] = ASVex(579,2525.4,2363.2813,4.1483,270.0,0,0,600);
	vehFBI[9] = ASVex(579,2525.4,2368.0686,4.1406,270.0,0,0,600);
	vehFBI[10] = ASVex(415,2515.45,2377.0808,5.9828,90.0166,0,0,600);
	vehFBI[11] = ASVex(415,2515.45,2381.6326,5.9821,90.1267,0,0,600);
	vehFBI[12] = ASVex(409,2542.3818,2397.3,4.0109,180.0,0,0,600);
	vehFBI[13] = ASVex(409,2537.7524,2397.3,4.0109,180.0,0,0,600);
	vehFBI[14] = ASVex(580,2524.7,2377.0769,4.0071,270.0,0,0,600);
	vehFBI[15] = ASVex(580,2524.7,2381.5398,4.0071,270.0,0,0,600);
	vehFBI[16] = ASVex(482,2510.5793,2397.8850,4.3366,180.0,0,0,600);
	vehFBI[17] = ASVex(487,2471.4229,2391.1145,71.2135,90.0,0,0,600);
	vehFBI[18] = ASVex(487,2471.0979,2368.8740,71.2254,90.0,0,0,600);
	new flashLight1 = CO(19620,0.0,0.0,0.0,0.0,0.0,0.0);
	new flashLight2 = CO(19620,0.0,0.0,0.0,0.0,0.0,0.0);
	new flashLight3 = CO(19620,0.0,0.0,0.0,0.0,0.0,0.0);
	new flashLight4 = CO(19620,0.0,0.0,0.0,0.0,0.0,0.0);
	new flashLight5 = CO(19620,0.0,0.0,0.0,0.0,0.0,0.0);
	AttachObjectToVehicle(flashLight1,vehFBI[5],0.0,-0.2,0.85,0.0,0.0,0.0);
	AttachObjectToVehicle(flashLight2,vehFBI[6],0.0,-0.2,0.85,0.0,0.0,0.0);
	AttachObjectToVehicle(flashLight3,vehFBI[7],0.0,-0.2,0.85,0.0,0.0,0.0);
	AttachObjectToVehicle(flashLight4,vehFBI[10],0.0,-0.35,0.6,0.0,0.0,0.0);
	AttachObjectToVehicle(flashLight5,vehFBI[11],0.0,-0.35,0.6,0.0,0.0,0.0);

	// police
	vehPolice[0] = ASVex(598,2282.0662,2442.7,10.5662,360.0,205,1,600);
	vehPolice[1] = ASVex(598,2277.7825,2442.7,10.5658,360.0,205,1,600);
	vehPolice[2] = ASVex(598,2273.6155,2442.7,10.5658,360.0,205,1,600);
	vehPolice[3] = ASVex(598,2269.2285,2442.7,10.5665,360.0,205,1,600);
	vehPolice[4] = ASVex(598,2260.4468,2442.7,10.5654,360.0,205,1,600);
	vehPolice[5] = ASVex(598,2256.1523,2442.7,10.5667,360.0,205,1,600);
	vehPolice[6] = ASVex(598,2251.7607,2442.7,10.5666,360.0,205,1,600);
	vehPolice[7] = ASVex(599,2260.4744,2477.8,11.0118,180.0,205,1,600);
	vehPolice[8] = ASVex(599,2256.0583,2477.8,11.0080,180.0,205,1,600);
	vehPolice[9] = ASVex(599,2251.9363,2477.8,11.0091,180.0,205,1,600);
	vehPolice[10] = ASVex(601,2277.7905,2477.5,10.5791,180.0,1,1,600);
	vehPolice[11] = ASVex(601,2273.5916,2477.5,10.5791,180.0,1,1,600);
	vehPolice[12] = ASVex(525,2282.2229,2459.75,10.9,180.0,53,79,600);
	vehPolice[13] = ASVex(525,2278.0208,2459.75,10.9,180.0,53,79,600);
	vehPolice[14] = ASVex(525,2273.8210,2459.75,10.9,180.0,53,79,600);
	vehPolice[15] = ASVex(427,2295.1699,2443.6919,10.9,360.0,205,1,600);
	vehPolice[16] = ASVex(427,2291.2080,2443.6152,10.9,360.0,205,1,600);
	vehPolice[17] = ASVex(497,2265.2483,2471.55,38.8604,360.0,205,1,600);
	vehPolice[18] = ASVex(497,2280.9624,2471.55,38.8626,360.0,205,1,600);
	vehPolice[19] = ASVex(523,2260.2388,2457.8,10.3850,180.0,0,0,600);
	vehPolice[20] = ASVex(523,2256.3967,2457.8,10.3871,180.0,0,0,600);
	vehPolice[21] = ASVex(523,2251.9214,2457.8,10.3896,180.0,0,0,600);
	vehPolice[22] = ASVex(523,2260.2883,2461.6,10.3907,360.0,0,0,600);
	vehPolice[23] = ASVex(523,2256.4072,2461.6,10.3906,360.0,0,0,600);
	vehPolice[24] = ASVex(523,2251.9211,2461.6,10.3903,360.0,0,0,600);

	// army
	vehArmy[0] = ASVex(431,277.0,1983.0,17.8,270.0,0,0,600); // ARMY bus1
	vehArmy[1] = ASVex(431,277.0,1989.0,17.8,270.0,0,0,600); // ARMY bus2
	vehArmy[2] = ASVex(431,277.0,1995.0,17.8,270.0,0,0,600); // ARMY bus3
	vehArmy[3] = ASVex(433,275.7,2018.0,18.1,270.0,0,0,600); // ARMY barracks1
	vehArmy[4] = ASVex(433,275.7,2024.0,18.1,270.0,0,0,600); // ARMY barracks2
	vehArmy[5] = ASVex(433,275.7,2030.0,18.1,270.0,0,0,600); // ARMY barracks3
	vehArmy[6] = ASVex(445,193.0,1919.7,17.9,180.0,0,0,600); // ARMY admiral1
	vehArmy[7] = ASVex(445,202.0,1919.7,17.9,180.0,0,0,600); // ARMY admiral2
	vehArmy[8] = ASVex(470,221.0,1855.0,13.0,0.0,0,0,600); // ARMY hammer1
	vehArmy[9] = ASVex(470,213.0,1855.0,13.0,0.0,0,0,600); // ARMY hammer2
	vehArmy[10] = ASVex(470,271.5,1949.0,17.7,270.0,0,0,600); // ARMY hammer3
	vehArmy[11] = ASVex(470,271.5,1955.0,17.7,270.0,0,0,600); // ARMY hammer4
	vehArmy[12] = ASVex(470,271.5,1961.0,17.7,270.0,0,0,600); // ARMY hammer5
	vehArmy[13] = ASVex(470,272.5,1965.0,17.7,270.0,0,0,600); // ARMY hammer6
	vehArmy[14] = ASVex(470,280.0,1946.0,17.7,0.0,0,0,600); // ARMY hammer7
	vehArmy[15] = ASVex(470,280.0,1964.0,17.7,180.0,0,0,600); // ARMY hammer8
	vehArmy[16] = ASVex(487,300.0,2050.0,17.9,180.0,0,0,600); // ARMY vert
	vehArmy[17] = ASVex(487,315.0,2050.0,17.9,180.0,0,0,600); // ARMY ver2
	vehArmy[18] = ASVex(500,211.0,1919.7,17.9,180.0,0,0,600); // ARMY mesa1
	vehArmy[19] = ASVex(533,220.0,1919.7,17.9,180.0,0,0,600); // ARMY mesa2
	vehArmy[20] = ASVex(548,309.0,1800.5,19.3,0.0,0,0,600); // ARMY cargobob
	
	// hospital
	vehHospital[0] = ASVex(416,1590.6499,1849.1,10.9697,180.0,1,3,600);
	vehHospital[0] = ASVex(416,1594.8217,1849.1,10.9695,180.0,1,3,600);
	vehHospital[0] = ASVex(416,1599.0747,1849.1,10.9694,180.0,1,3,600);
	vehHospital[0] = ASVex(416,1603.3191,1849.1,10.9695,180.0,1,3,600);
	vehHospital[0] = ASVex(487,1612.0781,1802.2,30.6406,360.0,3,1,600);
	vehHospital[0] = ASVex(487,1599.0455,1802.2,30.6457,360.0,3,1,600);
	vehHospital[0] = ASVex(499,1620.1934,1849.1,10.9141,180.0,3,1,600);

	// news
	vehNews[0] = ASVex(488,2653.9497,1213.6,27.1,180.0,158,49,600);
	vehNews[1] = ASVex(488,2635.8530,1213.6,27.1,180.0,158,49,600);
	vehNews[2] = ASVex(426,2662.6108,1167.3,10.8,360.0,158,158,600);
	vehNews[3] = ASVex(426,2657.5613,1167.3,10.8,360.0,158,158,600);
	vehNews[4] = ASVex(426,2652.3071,1167.3,10.8,360.0,158,158,600);
	vehNews[5] = ASVex(582,2647.5701,1167.9,10.8,360.0,158,49,600);
	vehNews[6] = ASVex(582,2642.5776,1167.9,10.8,360.0,158,49,600);
	vehNews[7] = ASVex(582,2637.3284,1167.9,10.8,360.0,158,49,600);

	// drive school
	vehDriveSchool[0] = ASVex(426,1103.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[1] = ASVex(426,1107.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[2] = ASVex(426,1111.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[3] = ASVex(426,1115.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[4] = ASVex(426,1119.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[5] = ASVex(426,1123.0,1358.0,10.7,180.0,3,3,600);
	vehDriveSchool[6] = ASVex(487,1163.0,1324.0,11.0,90.0,3,3,600);
	
	// mafia1

	// mafia2

	// mafia3

	// mafia4

	// mafia5
	
	// faggio - spawn
	vehScooters[0] = ASVex(462,1593.6302,1832.6196,10.42,180.0,163,163,600);
	vehScooters[1] = ASVex(462,1595.8481,1832.6899,10.42,180.0,163,163,600);
	vehScooters[2] = ASVex(462,1597.9888,1832.7008,10.42,180.0,163,163,600);
	vehScooters[3] = ASVex(462,1600.0680,1832.6942,10.42,180.0,163,163,600);
	vehScooters[4] = ASVex(462,1602.2068,1832.6854,10.42,180.0,163,163,600);
	vehScooters[5] = ASVex(462,1604.3335,1832.6678,10.42,180.0,163,163,600);
	
	// faggio - hospital
	vehScooters[6] = ASVex(426,1607.5404,1850.1730,10.5633,180.0,163,163,600);
	vehScooters[7] = ASVex(426,1611.7750,1850.2308,10.5633,180.0,163,163,600);
	vehScooters[8] = ASVex(426,1615.9801,1850.1042,10.5634,180.0,163,163,600);
	vehScooters[9] = ASVex(462,1706.8568,1465.2981,10.4079,289.0,163,163,600);
	vehScooters[10] = ASVex(462,1706.3885,1463.6250,10.4096,292.0,163,163,600);
	vehScooters[11] = ASVex(462,1705.8033,1461.8351,10.4097,300.0,163,163,600);
	
	// faggio - market
	vehScooters[12] = ASVex(462,2915.0,2442.0,10.5,90.0,163,163,600);
	vehScooters[13] = ASVex(462,2915.0,2439.0,10.5,90.0,163,163,600);
	vehScooters[14] = ASVex(462,2915.0,2436.0,10.5,90.0,163,163,600);
	vehScooters[15] = ASVex(462,2915.0,2433.0,10.5,90.0,163,163,600);
	vehScooters[16] = ASVex(462,2915.0,2430.0,10.5,90.0,163,163,600);
	vehScooters[17] = ASVex(462,2915.0,2427.0,10.5,90.0,163,163,600);
	
	// faggio - fort carson
	vehScooters[18] = ASVex(462,-96.0,1222.5,19.4,180.0,163,163,600);
	vehScooters[19] = ASVex(462,-93.0,1222.5,19.4,180.0,163,163,600);
	vehScooters[20] = ASVex(462,-90.0,1222.5,19.4,180.0,163,163,600);
	vehScooters[21] = ASVex(462,-87.0,1222.5,19.4,180.0,163,163,600);
	vehScooters[22] = ASVex(462,-84.0,1222.5,19.4,180.0,163,163,600);
	vehScooters[23] = ASVex(462,-81.0,1222.5,19.4,180.0,163,163,600);
	
	// faggio - las payasadas
	vehScooters[24] = ASVex(462,-229.0,2595.2,62.4,0.0,163,163,600);
	vehScooters[25] = ASVex(462,-226.0,2595.2,62.4,0.0,163,163,600);
	vehScooters[26] = ASVex(462,-223.0,2595.2,62.4,0.0,163,163,600);
	vehScooters[27] = ASVex(462,-220.0,2595.2,62.4,0.0,163,163,600);
	vehScooters[28] = ASVex(462,-217.0,2595.2,62.4,0.0,163,163,600);
	vehScooters[29] = ASVex(462,-214.0,2595.2,62.4,0.0,163,163,600);

	// faggio - las barrancas
	vehScooters[30] = ASVex(462,-865.0,1547.0,22.8708,270.0,163,163,600);
	vehScooters[31] = ASVex(462,-865.0,1550.0,23.1244,270.0,163,163,600);
	vehScooters[32] = ASVex(462,-865.0,1553.0,23.4033,270.0,163,163,600);
	vehScooters[33] = ASVex(462,-865.0,1556.0,23.6766,270.0,163,163,600);
	vehScooters[34] = ASVex(462,-865.0,1559.0,23.9105,270.0,163,163,600);
	vehScooters[35] = ASVex(462,-865.0,1562.0,24.1555,270.0,163,163,600);
	
	// faggio - el quebrado
	vehScooters[36] = ASVex(462,-1501.0,2525.4,55.4,0.0,163,163,600);
	vehScooters[37] = ASVex(462,-1504.0,2525.4,55.4,0.0,163,163,600);
	vehScooters[38] = ASVex(462,-1507.0,2525.4,55.4,0.0,163,163,600);
	vehScooters[39] = ASVex(462,-1523.0,2525.4,55.4,0.0,163,163,600);
	vehScooters[40] = ASVex(462,-1526.0,2525.4,55.4,0.0,163,163,600);
	vehScooters[41] = ASVex(462,-1529.0,2525.4,55.4,0.0,163,163,600);
	
	// faggio - bayside marina
	vehScooters[42] = ASVex(462,-2452.0,2224.0,4.6,0.0,163,163,600);
	vehScooters[43] = ASVex(462,-2455.0,2224.0,4.6,0.0,163,163,600);
	vehScooters[44] = ASVex(462,-2459.0,2224.0,4.6,0.0,163,163,600);
	vehScooters[45] = ASVex(462,-2462.0,2224.0,4.6,0.0,163,163,600);
	vehScooters[46] = ASVex(462,-2465.0,2224.0,4.6,0.0,163,163,600);
	vehScooters[47] = ASVex(462,-2468.0,2224.0,4.6,0.0,163,163,600);
	
	// bus
	vehBus[0] = ASVex(437,2767.6133,1265.5289,10.8833,270.0,226,229,600);
	vehBus[1] = ASVex(437,2767.6299,1271.9460,10.8833,270.0,226,229,600);
	vehBus[2] = ASVex(437,2767.5881,1278.3071,10.8833,270.0,226,229,600);
	vehBus[3] = ASVex(437,2767.5754,1284.7698,10.8833,270.0,226,229,600);
	vehBus[4] = ASVex(437,2767.4978,1291.1041,10.8833,270.0,226,229,600);
	vehBus[5] = ASVex(437,2767.4824,1296.7198,10.8833,270.0,226,229,600);
	
	// taxi
	vehTaxi[0] = ASVex(420,2464.90,1345.61,10.6026,360.0,6,1,600);
	vehTaxi[1] = ASVex(420,2458.47,1345.61,10.6011,360.0,6,1,600);
	vehTaxi[2] = ASVex(420,2452.09,1345.61,10.5990,360.0,6,1,600);
	vehTaxi[3] = ASVex(438,2452.09,1336.50,10.5998,180.0,6,1,600);
	vehTaxi[4] = ASVex(438,2458.47,1336.50,10.6001,180.0,6,1,600);
	vehTaxi[5] = ASVex(438,2464.90,1336.50,10.6003,180.0,6,1,600);
	
	// mechanic
	vehMechanic[0] = ASVex(525,2100.7144,1409.1077,10.8,360.0,43,17,600);
	vehMechanic[1] = ASVex(525,2107.1392,1409.1051,10.8,360.0,43,17,600);
	vehMechanic[2] = ASVex(525,2113.6013,1409.0767,10.8,360.0,43,17,600);
	vehMechanic[3] = ASVex(525,2119.9688,1409.0902,10.8,360.0,43,17,600);
	vehMechanic[4] = ASVex(525,2126.3979,1409.1039,10.8,360.0,43,17,600);
	vehMechanic[5] = ASVex(525,2132.7322,1409.0400,10.8,360.0,43,17,600);
	
	// trashmaster
	vehTrashmaster[0][tID] = ASVex(408,2295.6,2738.3870,11.5,270.0,26,26,600);
	vehTrashmaster[1][tID] = ASVex(408,2295.6,2747.9150,11.5,270.0,26,26,600);
	vehTrashmaster[2][tID] = ASVex(408,2295.6,2754.5466,11.5,270.0,26,26,600);
	vehTrashmaster[3][tID] = ASVex(408,2295.6,2763.9771,11.5,270.0,26,26,600);
	vehTrashmaster[4][tID] = ASVex(408,2295.6,2770.4812,11.5,270.0,26,26,600);
	vehTrashmaster[5][tID] = ASVex(408,2295.6,2780.0242,11.5,270.0,26,26,600);
	format(string,sizeof(string),TrashmasterText,0);
	for(new i = 0; i < 6; ++i) {
		vehTrashmaster[i][t3D] = Create3DTextLabel(string,WHITE,0.0,0.0,0.0,DISTANCE_BETWEEN_PLAYERS * 4,0,1);
		Attach3DTextLabelToVehicle(vehTrashmaster[i][t3D],vehTrashmaster[i][tID],0.0,0.0,0.0);
	}
	
	// pizzaboy
	VehPizzaboy[0] = ASVex(448,2372.2688,2022.4340,10.4196,140.0,175,6,600);
	VehPizzaboy[1] = ASVex(448,2374.2349,2022.3234,10.4192,140.0,175,6,600);
	VehPizzaboy[2] = ASVex(448,2376.2944,2022.3685,10.4188,140.0,175,6,600);
	VehPizzaboy[3] = ASVex(448,2378.6189,2022.3756,10.4195,140.0,175,6,600);
	VehPizzaboy[4] = ASVex(448,2380.8914,2022.3195,10.4189,140.0,175,6,600);
	VehPizzaboy[5] = ASVex(448,2382.9519,2022.2837,10.4188,140.0,175,6,600);

	// delivery
	VehDelivery[0] = ASVex(440,1680.5,2318.0,11.0,270.0,110,110,600);
	VehDelivery[1] = ASVex(440,1680.5,2327.0,11.0,270.0,110,110,600);
	VehDelivery[2] = ASVex(440,1680.5,2333.0,11.0,270.0,110,110,600);
	VehDelivery[3] = ASVex(440,1680.5,2345.0,11.0,270.0,110,110,600);
	VehDelivery[4] = ASVex(440,1680.5,2352.0,11.0,270.0,110,110,600);
	VehDelivery[5] = ASVex(440,1680.5,2363.0,11.0,270.0,110,110,600);
	
	// truck
 	VehTruck[0] = ASVex(514,282.4,1348.0,11.2,90.0,101,101,600);
 	VehTruck[1] = ASVex(514,282.4,1355.0,11.2,90.0,101,101,600);
 	VehTruck[2] = ASVex(514,282.4,1362.0,11.2,90.0,101,101,600);
 	VehTruck[3] = ASVex(514,282.4,1369.0,11.2,90.0,101,101,600);
 	VehTruck[4] = ASVex(514,282.4,1376.0,11.2,90.0,101,101,600);
 	VehTruck[5] = ASVex(514,282.4,1383.0,11.2,90.0,101,101,600);

	// collectors
	VehCollector[0] = ASVex(428,2374.0,2399.8,11.1,180.0,0,0,600);
	VehCollector[1] = ASVex(428,2379.0,2399.8,11.1,180.0,0,0,600);
	VehCollector[2] = ASVex(428,2384.0,2399.8,11.1,180.0,0,0,600);
	VehCollector[3] = ASVex(428,2389.0,2399.8,11.1,180.0,0,0,600);
	VehCollector[4] = ASVex(428,2394.0,2399.8,11.1,180.0,0,0,600);
	VehCollector[5] = ASVex(428,2399.0,2399.8,11.1,180.0,0,0,600);
	
	// fire truck
	VehFireTruck[0][tID] = ASVex(407,1770.0,2077.4,11.2,180.0,0,0,600);
	VehFireTruck[1][tID] = ASVex(407,1763.0,2077.4,11.2,180.0,0,0,600);
	VehFireTruck[2][tID] = ASVex(407,1757.0,2077.4,11.2,180.0,0,0,600);
	VehFireTruck[3][tID] = ASVex(407,1750.0,2077.4,11.2,180.0,0,0,600);
	VehFireTruck[4][tID] = ASVex(544,1731.5,2078.0,11.2,270.0,0,0,600);
	VehFireTruck[5][tID] = ASVex(544,1731.5,2072.0,11.2,270.0,0,0,600);
	format(string,sizeof(string),FireTruckText,150);
	for(new i = 0; i < 6; ++i) {
		VehFireTruck[i][t3D] = Create3DTextLabel(string,WHITE,0.0,0.0,0.0,DISTANCE_BETWEEN_PLAYERS * 4,0,1);
		Attach3DTextLabelToVehicle(VehFireTruck[i][t3D],VehFireTruck[i][tID],0.0,0.0,0.0);
	}

	// sweppwers
	vehSwepper[0] = ASVex(574,1419.0,972.3,10.7,0.0,1,1,600);
	vehSwepper[1] = ASVex(574,1415.0,972.3,10.7,0.0,1,1,600);
	vehSwepper[2] = ASVex(574,1411.0,972.3,10.7,0.0,1,1,600);
	vehSwepper[3] = ASVex(574,1407.0,972.3,10.7,0.0,1,1,600);
	vehSwepper[4] = ASVex(574,1403.0,972.3,10.7,0.0,1,1,600);
	vehSwepper[5] = ASVex(574,1399.0,972.3,10.7,0.0,1,1,600);
	
	// utility van
	VehUtilityVan[0] = ASVex(552,1655.5,1000.0,10.7,0.0,0,0,600);
	VehUtilityVan[1] = ASVex(552,1661.9,1000.0,10.7,0.0,0,0,600);
	VehUtilityVan[2] = ASVex(552,1668.0,1000.0,10.7,0.0,0,0,600);
	VehUtilityVan[3] = ASVex(552,1668.0,987.0,10.7,180.0,0,0,600);
	VehUtilityVan[4] = ASVex(552,1661.9,987.0,10.7,180.0,0,0,600);
	VehUtilityVan[5] = ASVex(552,1655.5,987.0,10.7,180.0,0,0,600);

	// rent cheap
	VehRentCheap[0] = ASVex(421,2247.0,2034.6324,10.5634,270.0,60,1,300);
	VehRentCheap[1] = ASVex(421,2247.0,2042.5090,10.5630,270.0,60,1,300);
	VehRentCheap[2] = ASVex(421,2247.0,2050.2695,10.5633,270.0,60,1,300);
	VehRentCheap[3] = ASVex(516,2234.8,2050.3049,10.5639,90.0,60,1,300);
	VehRentCheap[4] = ASVex(516,2234.8,2042.4319,10.5633,90.0,60,1,300);
	VehRentCheap[5] = ASVex(516,2234.8,2034.6493,10.5637,90.0,60,1,300);

	// rent middle
	
	// rent expensive
	
	// quad bike
	
	// karts
	VehKarts[0] = ASVex(571,1115.0,1729.0,10.15,90.0,0,0,600);
	VehKarts[1] = ASVex(571,1115.0,1731.0,10.15,90.0,0,0,600);
	VehKarts[2] = ASVex(571,1115.0,1733.0,10.15,90.0,0,0,600);
	VehKarts[3] = ASVex(571,1115.0,1735.0,10.15,90.0,0,0,600);
	VehKarts[4] = ASVex(571,1115.0,1737.0,10.15,90.0,0,0,600);
	VehKarts[5] = ASVex(571,1115.0,1739.0,10.15,90.0,0,0,600);
	VehKarts[6] = ASVex(571,1115.0,1741.0,10.15,90.0,0,0,600);
	VehKarts[7] = ASVex(571,1115.0,1743.0,10.15,90.0,0,0,600);
	VehKarts[8] = ASVex(571,1115.0,1745.0,10.15,90.0,0,0,600);
	VehKarts[9] = ASVex(571,1115.0,1747.0,10.15,90.0,0,0,600);
	
	// zags
	
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadHouses() {
	ClearQuery();
	cache = mysql_query(MySQL:DATABASE,"SELECT * FROM `houses`");
	if(cache_get_row_count(rows)) {
		if(rows != 0) {
			for(new i = 0; i < rows; ++i) {
			    cache_get_value_name_int(i,"ID",houseVariable[i][hID]);
			    cache_get_value_name_int(i,"Type",houseVariable[i][hType]);
			    cache_get_value_name_float(i,"PosX",houseVariable[i][hX]);
			    cache_get_value_name_float(i,"PosY",houseVariable[i][hY]);
			    cache_get_value_name_float(i,"PosZ",houseVariable[i][hZ]);
			    cache_get_value_name_int(i,"Price",houseVariable[i][hPrice]);
			    cache_get_value_name_int(i,"Name",houseVariable[i][hName]);
			    cache_get_value_name_int(i,"Paying",houseVariable[i][hPaying]);
			    cache_get_value_name_int(i,"Payed",houseVariable[i][hPayed]);
			    cache_get_value_name_bool(i,"Garage",houseVariable[i][hGarage]);
			    cache_get_value_name_float(i,"GaragePosX",houseVariable[i][hGarageX]);
			    cache_get_value_name_float(i,"GaragePosY",houseVariable[i][hGarageY]);
			    cache_get_value_name_float(i,"GaragePosZ",houseVariable[i][hGarageZ]);
			    cache_get_value_name_int(i,"GarageInterior",houseVariable[i][hGarageInterior]);
			    cache_get_value_name_bool(i,"Basement",houseVariable[i][hBasement]);
			    cache_get_value_name_int(i,"BasementInterior",houseVariable[i][hBasementInterior]);
			    cache_get_value_name_bool(i,"DoorHouse",houseVariable[i][hDoorHouse]);
			    cache_get_value_name_bool(i,"DoorGarage",houseVariable[i][hDoorGarage]);
			    cache_get_value_name_bool(i,"DoorBasement",houseVariable[i][hDoorBasement]);
			    cache_get_value_name_int(i,"Owner",houseVariable[i][hOwner]);
			    cache_get_value_name_int(i,"Deputy",houseVariable[i][hDeputy]);
			    cache_get_value_name_int(i,"Family",houseVariable[i][hFamily]);
			}
		} else { Debugging("houses",0,0,123456); }
	} else { Debugging("houses : cache",0,0,0); }
	cache_delete(cache);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadBuisnesses() {
	ClearQuery();
	mysql_tquery(MySQL:DATABASE,"SELECT * FROM `buisnesses`");
	if(cache_get_row_count(rows)) {
	    if(rows != 0) {
			for(new i; i < rows; ++i) {

			}
		} else { Debugging("businesses",0,0,123456); }
	} else { Debugging("businesses : cache",0,0,0); }
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadJobs() {
	LoadJobLoader();
	LoadJobBus();
	LoadJobTaxi();
	LoadJobTrashmaster();
	return 1;
}

static stock LoadJobLoader() {
 	AddPlayerClass(45,1613.99023, 2347.07153, 9.80834,270.4224,24,500,31,1000,0,0);
    CreateActor(27,1598.4,2292.9001,10.8203,270.0);
	return 1;
}

static stock LoadJobBus() {

}

static stock LoadJobTaxi() {

}

static stock LoadJobTrashmaster() {
	// 1227 - green
	// 1334 - blue
	// 1331 - lime
	// 1332 - green
	// 1333 - red
	// 1336 - blue
	// 3035 - gray
	// 1439 - green
	
	ClearQuery();
	cache = mysql_query(MySQL:DATABASE,"SELECT * FROM `trash_cans`");
	if(cache_get_row_count(rows)) {
	    printf("rows = %i",rows);
		if(rows != 0) {
		    for(new i = 0; i < rows; ++i) {
				cache_get_value_name_int(i,"ID",trashcanVariable[i][tID]);
				cache_get_value_name_int(i,"Type",trashcanVariable[i][tType]);
				cache_get_value_name_float(i,"PosX",trashcanVariable[i][tX]);
				cache_get_value_name_float(i,"PosY",trashcanVariable[i][tY]);
				cache_get_value_name_float(i,"PosZ",trashcanVariable[i][tZ]);
				cache_get_value_name_float(i,"RotX",trashcanVariable[i][tRX]);
				cache_get_value_name_float(i,"RotY",trashcanVariable[i][tRY]);
				cache_get_value_name_float(i,"RotZ",trashcanVariable[i][tRZ]);
				cache_get_value_name_int(i,"Cell1",trashcanVariable[i][tCell1]);
				cache_get_value_name_int(i,"Cell2",trashcanVariable[i][tCell2]);
				cache_get_value_name_int(i,"Cell3",trashcanVariable[i][tCell3]);
				cache_get_value_name_int(i,"Cell4",trashcanVariable[i][tCell4]);
				cache_get_value_name_int(i,"Cell5",trashcanVariable[i][tCell5]);
				cache_get_value_name_int(i,"Cell6",trashcanVariable[i][tCell6]);
				cache_get_value_name_int(i,"Cell7",trashcanVariable[i][tCell7]);
				cache_get_value_name_int(i,"Cell8",trashcanVariable[i][tCell8]);
				cache_get_value_name_int(i,"Cell9",trashcanVariable[i][tCell9]);
				trashcanVariable[i][tFullness] = CalculateFullnessTrashcan(i);
				
				CDO(trashcanVariable[i][tType],trashcanVariable[i][tX],trashcanVariable[i][tY],trashcanVariable[i][tZ],
				trashcanVariable[i][tRX],trashcanVariable[i][tRY],trashcanVariable[i][tRZ]);
				format(string,sizeof(string),TrashcanText,i,0);
				trashcanVariable[i][t3D] = Create3DTextLabel(string,WHITE,trashcanVariable[i][tX],
				trashcanVariable[i][tY],trashcanVariable[i][tZ],DISTANCE_BETWEEN_PLAYERS * 4,0,0);
			}
		} else { Debugging("trashmaster: rows",0,0,1); }
	} else { Debugging("trashmaster : cache",0,0,0); }
	cache_delete(cache);
	return 1;
}

static stock ClearTrashcan(i) {
    trashcanVariable[i][tCell1] = 0;
    trashcanVariable[i][tCell2] = 0;
    trashcanVariable[i][tCell3] = 0;
    trashcanVariable[i][tCell4] = 0;
    trashcanVariable[i][tCell5] = 0;
    trashcanVariable[i][tCell6] = 0;
    trashcanVariable[i][tCell7] = 0;
    trashcanVariable[i][tCell8] = 0;
    trashcanVariable[i][tCell9] = 0;
    return 1;
}

static stock CalculateFullnessTrashcan(i) {
	new count = 0;
	if(trashcanVariable[i][tCell1] > 0) count += random(7);
	if(trashcanVariable[i][tCell2] > 0) count += random(7);
	if(trashcanVariable[i][tCell3] > 0) count += random(7);
	if(trashcanVariable[i][tCell4] > 0) count += random(7);
	if(trashcanVariable[i][tCell5] > 0) count += random(7);
	if(trashcanVariable[i][tCell6] > 0) count += random(7);
	if(trashcanVariable[i][tCell7] > 0) count += random(7);
	if(trashcanVariable[i][tCell8] > 0) count += random(7);
	if(trashcanVariable[i][tCell9] > 0) count += random(7);
	return count;
}

static stock FindNearestTrashcan(playerid) {
	new Float:pX,Float:pY,Float:pZ;
	GetPlayerPos(playerid,pX,pY,pZ);
	
	new nearestID = 0,Float:nearestDist = 999999.9;

	for(new i = 0; i < MAX_TRASHCANS; ++i) {
      	new Float:dist = floatsqroot(floatpower(floatabs(floatsub(pX,trashcanVariable[i][tX])),2)+floatpower(floatabs(floatsub(pY,trashcanVariable[i][tY])),2)+floatpower(floatabs(floatsub(pZ,trashcanVariable[i][tZ])),2));
		if(dist < nearestDist) {
		    nearestID = i;
			nearestDist = dist;
		}
	}
	return nearestID;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadHotels()
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadFamilies()
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadGangZones() {
	ClearQuery();
	cache = mysql_query(MySQL:DATABASE,"SELECT * FROM `gang_zones`");
	if(cache_get_row_count(rows)) {
		if(rows != 0) {
			for(new i = 0; i < MAX_GANGZONES; ++i) {
				cache_get_value_name_int(i,"ID",gangVariable[i][gID]);
				cache_get_value_name_int(i,"FamID",gangVariable[i][gFamID]);
				cache_get_value_name_float(i,"TopLeftX",gangVariable[i][gTopLeftX]);
				cache_get_value_name_float(i,"TopLeftY",gangVariable[i][gTopLeftY]);
				cache_get_value_name_float(i,"BottomRightX",gangVariable[i][gBottomRightX]);
				cache_get_value_name_float(i,"ButtomRightY",gangVariable[i][gBottomRightY]);

				gangZones[i] = GangZoneCreate(gangVariable[i][gTopLeftX],gangVariable[i][gTopLeftY],gangVariable[i][gBottomRightX],gangVariable[i][gBottomRightY]);
			}
		} else {
			Debugging("load gang zones : rows",0,rows,123456);
		}
	} else {
		Debugging("load gang zones : cache",0,0,0);
	}

	cache_delete(cache);
	new Float:coords[5] = {900.0,2830.0,2860.0,720.0}; // 1960 x 2110
	new Float:width = 190.0,
	    Float:height = 200.0,
	    Float:distX = 6.0,
	    Float:distY = 10.0;
	for(new i = 0; i < 10; ++i) {
	    for(new j = 0; j < 10; ++j) {
			new Float:topX = coords[0] + width * j + distX;
			new Float:topY = coords[1] - height * i - distY;
			new Float:bottomX = topX + width;
			new Float:bottomY = topY - height;
			gangZones[i] = GangZoneCreate(topX,bottomY,bottomX,topY);
			printf("%i %f %f %f %f",gangZones[i],topX,bottomY,bottomX,topY);
		}
	}
	gangZones[0] = GangZoneCreate(1701.0,1330.0,1754.0,1480.0);
    zone1 = GangZoneCreate(-1350,2480,-1269,2565); // mafia - stonehenge
	zone2 = GangZoneCreate(-406,1500,-277,1630); // mafia - uho
	zone3 = GangZoneCreate(-25,1677,443,2113); // army
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadPickups() {
	// govern
	PICKUPS[0] = CreatePickup(1318,23,1037.7410,1015.1852,11.0000,-1);
	PICKUPS[1] = CreatePickup(1318,23,1057.0551,1006.4174,27.1511,-1);
	PICKUPS[2] = CreatePickup(1318,23,390.3137,173.7907,1008.3828,-1);
	PICKUPS[3] = CreatePickup(1318,23,344.6231,178.3591,1014.1875,-1);
	PICKUPS[4] = CreatePickup(2663,23,371.6222,177.5902,1019.9844,-1);
	PICKUPS[5] = CreatePickup(1239,23,362.1928,173.7070,1008.3828,-1);
	PICKUPS[6] = CreatePickup(1242,23,349.2532,158.6264,1014.1875,-1);
	PICKUPS[7] = CreatePickup(334,23,349.4174,160.8898,1014.1875,-1);
	PICKUPS[8] = CreatePickup(2663,23,361.5557,159.4771,1008.3828,-1);
	PICKUPS[9] = CreatePickup(1275,23,372.9504,171.3146,1019.9844,-1);
	PICKUPS[10] = CreatePickup(1241,23,349.6003,161.2835,1019.9912,-1);

	// police
	PICKUPS[20] = CreatePickup(1318,23,2290.1265,2431.2390,10.8203,-1);
	PICKUPS[21] = CreatePickup(1318,23,2296.8699,2451.4722,10.8203,-1);
	PICKUPS[22] = CreatePickup(1318,23,2258.5505,2453.9263,38.6837,-1);
	PICKUPS[23] = CreatePickup(1318,23,238.6706,139.1532,1003.0234,-1);
	PICKUPS[24] = CreatePickup(1318,23,207.8645,142.2246,1003.0234,-1);
	PICKUPS[25] = CreatePickup(1318,23,236.9222,195.8138,1008.1719,-1);

	// fbi
	//PICKUPS[3] = CreatePickup(1318,23,2388.3030,2466.0745,10.8203,-1); // court
	PICKUPS[40] = CreatePickup(1318,23,2446.7708,2376.2002,12.1635,-1);
	PICKUPS[41] = CreatePickup(1318,23,2488.0691,2397.2468,4.2109,-1);
	PICKUPS[42] = CreatePickup(1318,23,2490.4155,2389.8691,71.0496,-1);
	PICKUPS[43] = CreatePickup(1318,23,246.4202,107.7751,1003.2188,-1);
	PICKUPS[44] = CreatePickup(1318,23,215.5356,126.3302,1003.2188,-1);
	PICKUPS[45] = CreatePickup(1318,23,238.4407,114.7615,1010.2188,-1);

	// army

	// hospital
	PICKUPS[80] = CreatePickup(1318,23,1607.3688,1816.1871,10.8203,-1); // hosp off
	PICKUPS[81] = CreatePickup(1318,23,1604.4855,1722.8733,10.8203,-1); // hosp back
	PICKUPS[82] = CreatePickup(1318,23,1617.9523,1787.5884,30.4688,-1); // hosp roof
	PICKUPS[83] = CreatePickup(1318,23,1607.0051,1820.4598,10.8280,-1);

	PICKUPS[9] = CreatePickup(1318,23,2645.2778,1184.5973,10.8203,-1); // news
	//PICKUPS[25] = CreatePickup(1318,23,2127.5,2379.0,10.8203,-1); // HOTEL Emerald enter
	//PICKUPS[26] = CreatePickup(1318,23,2218.0,-1076.2,1050.4844,-1); // HOTEL Emerald exit
	
	PICKUPS[140] = CreatePickup(1318,23,2363.8,2377.6,10.8,-1);
	PICKUPS[141] = CreatePickup(1318,23,2305.6,-16.1604,26.7,-1);
	PICKUPS[142] = CreatePickup(1274,23,2316.6,-15.4969,26.7422,-1);
	PICKUPS[143] = CreatePickup(1274,23,2316.6,-12.7590,26.7422,-1);
 	PICKUPS[144] = CreatePickup(1274,23,2316.6,-10.0187,26.7422,-1);
 	PICKUPS[145] = CreatePickup(1274,23,2316.6,-7.32430,26.7422,-1);
 	
 	PICKUPS[500] = CreatePickup(1239,23,1598.4,2290.0752,10.8203,-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock LoadMapIcons(playerid) {
	SetPlayerMapIcon(playerid,10,1158.5143,2072.2415,11.0625,10,0,MAPICON_LOCAL);
	SetPlayerMapIcon(playerid,11,1873.1842,2071.8477,11.0625,10,0,MAPICON_LOCAL);
	SetPlayerMapIcon(playerid,12,2170.1443,2795.8250,10.8203,10,0,MAPICON_LOCAL);
	SetPlayerMapIcon(playerid,13,2366.1816,2071.0344,10.8203,10,0,MAPICON_LOCAL);
	
	new markerType = 0;
	for(new i = 0; i < MAX_HOUSES; ++i) {
	    if(houseVariable[i][hOwner] > 0) markerType = 32;
		else markerType = 31;
		SetPlayerMapIcon(playerid,i,houseVariable[i][hX],houseVariable[i][hY],houseVariable[i][hZ],markerType,0,0);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CreateLabel(playerid,text[],color,Float:X,Float:Y,Float:Z,dist,visible) {
	new PlayerText3D:result;
	result = CreatePlayer3DTextLabel(playerid,text,color,X,Y,Z,DISTANCE_BETWEEN_PLAYERS*dist,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,visible);
	return result;
}

static stock Load3DTextLabels(playerid) {
	format(string,sizeof(string),ActorText,"Джереми","Гид");
    //CreatePlayer3DTextLabel(playerid,"{DDDDDD}Джереми\n\n{60F339}Квестовый персонаж\n{CCCCCC}Нажмите [ ALT ]",WHITE,1696.7897,1456.7030,11.0000,10,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,string,WHITE,1696.7897,1456.7030,11.0000,10,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	format(string,sizeof(string),ActorText,"Мэтью","Прораб");
 	CreatePlayer3DTextLabel(playerid,string,WHITE,1598.4,2292.9001,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	//CreateLabel(playerid,string,WHITE,1600.0,2300.0,11.0,3,1);

	Load3DTextLabelsHouses(playerid);
	Load3DTextLabelsBusinesses(playerid);
	
    CreatePlayer3DTextLabel(playerid,"Правительство",COLOR_GOVERN,1037.7410,1015.1852,11.0000,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №2",COLOR_GOVERN,1057.0551,1006.4174,27.1511,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход",COLOR_GOVERN,390.3137,173.7907,1008.3828,DISTANCE_BETWEEN_PLAYERS,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход на крышу",COLOR_GOVERN,344.6231,178.3591,1014.1875,DISTANCE_BETWEEN_PLAYERS,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);

	CreatePlayer3DTextLabel(playerid,"Полицейский департамент",COLOR_POLICE,2290.1265,2431.2390,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №2",COLOR_POLICE,2296.8699,2451.4722,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №3",COLOR_POLICE,2258.5505,2453.9263,38.6837,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход в гараж",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход на крышу",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    
	CreatePlayer3DTextLabel(playerid,"Министерство Юстиции",WHITE,2388.3030,2466.0745,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);

    CreatePlayer3DTextLabel(playerid,"Федеральное Бюро Расследований",COLOR_POLICE,2446.8689,2376.2734,12.1635,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №2",COLOR_POLICE,2488.2971,2397.2900,4.2109,15,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №3",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход в гараж",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход на крышу",COLOR_POLICE,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);

    // army

    CreatePlayer3DTextLabel(playerid,"Центральная больница",COLOR_HOSPITAL,1607.3688,1816.1871,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №2",COLOR_HOSPITAL,1617.9523,1787.5884,30.4688,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Вход №3",COLOR_HOSPITAL,1604.4855,1722.8733,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход",COLOR_HOSPITAL,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход на крышу",COLOR_HOSPITAL,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    CreatePlayer3DTextLabel(playerid,"Выход №2",COLOR_HOSPITAL,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
    
	CreatePlayer3DTextLabel(playerid,"Радиоцентр",COLOR_NEWS,2645.2778,1184.5973,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Вход №2",COLOR_NEWS,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Выход",COLOR_NEWS,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Выход на крышу",COLOR_NEWS,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);

	// drive school

	CreatePlayer3DTextLabel(playerid,"Банк",COLOR_BANK,2363.8,2377.6,10.8,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Выход",COLOR_BANK,2305.6,-16.1604,26.7,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Касса",COLOR_BANK,2316.6,-15.4969,26.7422,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Касса",COLOR_BANK,2316.6,-12.7590,26.7422,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Касса",COLOR_BANK,2316.6,-10.0187,26.7422,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	CreatePlayer3DTextLabel(playerid,"Касса",COLOR_BANK,2316.6,-7.32430,26.7422,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	
	// loaders
 	CreatePlayer3DTextLabel(playerid,"Информация о работе",COLOR_BANK,1598.4,2290.0752,10.8203,DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
 	return 1;
}


static stock Load3DTextLabelsHouses(playerid) {
	for(new i = 0; i < MAX_HOUSES; ++i) {
		ClearQuery();
	    new nickName[33],
			garageIs[32],
			garageDoor[16];

	    format(query,sizeof(query),"SELECT `NickName` FROM `account` WHERE `ID` = '%i' LIMIT 1",houseVariable[i][hOwner]);
	    mysql_tquery(MySQL:DATABASE,query);

		if(cache_get_row_count(rows)) {
			if(rows == 1) {
				cache_get_value_name(0,"NickName",nickName,0);
			} else {
				format(nickName,sizeof(nickName),"отсутствует");
			}
		} else {
		    continue;
		}

		if(houseVariable[i][hGarage] == true) {
			format(garageIs,sizeof(garageIs),"имеется");
			if(houseVariable[i][hDoorGarage] == true) {
				format(garageDoor,sizeof(garageDoor),"открыт");
			} else {
				format(garageDoor,sizeof(garageDoor),"закрыт");
			}
			format(string,sizeof(string),GarageText,houseVariable[i][hID],garageTypes[houseVariable[i][hGarageInterior]][eValue],garageDoor);
			CreatePlayer3DTextLabel(playerid,string,WHITE,houseVariable[i][hGarageX],houseVariable[i][hGarageY],houseVariable[i][hGarageZ],
									DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
		} else {
		    format(garageIs,sizeof(garageIs),"отсутсвует");
		}

	    format(string,sizeof(string),HouseText,houseVariable[i][hID],houseTypes[houseVariable[i][hType]][eValue],nickName,garageIs);

	    if(houseVariable[i][hFamily]!=0) {
			format(string,sizeof(string),"%s\n\nСемья: %s",string,familyVariable[houseVariable[i][hFamily]][fName]);
		}
	    CreatePlayer3DTextLabel(playerid,string,WHITE,houseVariable[i][hX],houseVariable[i][hY],houseVariable[i][hZ],DISTANCE_BETWEEN_PLAYERS*2,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1);
	}
}

static stock Load3DTextLabelsBusinesses(playerid) {
	for(new i = 0; i < MAX_BUSINESSES; ++i) {
        ClearQuery();
	}
}

////////////////////////////////////////////////////////////////////////////////

static stock Mapping() {
	CDO(1684,1595.49316,2291.25415,11.47360,0.0,0.0,90.0);
	CDO(19313,1577.37939,2320.69067,11.05570,0.0,0.0,90.0);
	CDO(19313,1577.26843,2345.67505,11.05570,0.0,0.0,90.0);
	CDO(19313,1619.91626,2283.18384,11.08237,0.0,0.0,0.0);
	CDO(19313,1594.88989,2283.17188,11.08237,0.0,0.0,0.0);
	CDO(19379,-1105.31860,416.76840,498.38000,0.0,90.0,0.0);
	CDO(19313,1577.37939,2320.69067,11.05570,0.0,0.0,90.0);
	CDO(19313,1577.26843,2345.67505,11.05570,0.0,0.0,90.0);
	CDO(968,1577.50745,2338.05737,10.16040,0.0,0.0,0.0);
	CDO(19313,1619.91626,2283.18384,11.08237,0.0,0.0,0.0);
	CDO(19313,1594.88989,2283.17188,11.08237,0.0,0.0,0.0);
	CDO(3626,1626.77771,2380.04785,11.30000,0.0,0.0,0.0);
	CDO(1440,1668.66760,2372.25293,9.92905,0.0,0.0,0.0);
	CDO(1440,1634.63391,2400.07495,10.50000,0.0,0.0,90.0);
	CDO(1438,1620.93005,2380.37134,9.80000,0.0,0.0,0.0);
	/*
	MappingInteriorGovernment();
	MappingInteriorPolice();
	MappingInteriorFBI();
	MappingInteriorArmy();
	MappingInteriorHospital();
	MappingInteriorNews();
	MappingInteriorDriveSchool();
	MappingInteriorMafia();
	
	MappingInteriorBank();
	MappingInteriorRegistryOffice();
	MappingInteriorStadion();
	
	MappingInterior24_7();*/
    return 1;
}

static stock DeMapping(playerid) {
	// мусорки у прав-ва
	RBFP(playerid,1331, 1004.8125, 1068.0703, 10.6250, 0.25);
	RBFP(playerid,1331, 1002.5625, 1068.0703, 10.6250, 0.25);

	// пожарная станция
	RBFP(playerid,712,1722.5078, 2083.8828, 19.0156, 0.25);
	RBFP(playerid,759,1723.8125, 2081.2109, 10.2422, 0.25);
	RBFP(playerid,759,1723.3125, 2075.1094, 10.2422, 0.25);
	RBFP(playerid,651,1721.9688, 2072.1172, 10.0234, 0.25);
	RBFP(playerid,651,1723.1094, 2086.2266, 10.0234, 0.25);
	RBFP(playerid,759,1732.1328, 2073.1641, 10.2422, 0.25);
	RBFP(playerid,759,1735.7344, 2069.0625, 10.2422, 0.25);
	RBFP(playerid,651,1734.0078, 2072.1875, 10.0234, 0.25);
	RBFP(playerid,651,1737.0391, 2066.9609, 10.0234, 0.25);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////








////////////////////////////////////////////////////////////////////////////////

static stock DialogMenu(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,20,DSL,"Меню","1. Статистика\n2. Навыки персонажа\n3. Помощь администрации\n4. Команды сервера\n5. Настройки",ButtonSelect,ButtonExit);
		case 1: SPD(playerid,21,DSL,"Статистика","",ButtonBack,ButtonExit);
		case 2: SPD(playerid,22,DSL,"Нываки персонажа","",ButtonBack,ButtonExit);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogGPS(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7100,DSL,"Навигатор","1. Важные места\n2. Государственные организации\n3. Нелегальные организации\n4. По работе\n5. Развлечения \
		\n6. Поиск ближайшего магазина 24/7\n7. Поиск ближайшей АЗС\n8. Поиск ближайшей закусочной\n9. Поиск ближайшейшего отеля \
		\n10. Поиск ближайшего терминала\n11. Выключить навигатор","Выбрать","Закрыть");
		case 1: SPD(playerid,7101,DSL,"Навигатор - Важные места","1. Правительство\n2Банк\n. Центральный рынок\n3. Военкомат\n4. ЗАГС\n5. Отели\n6. \n\n\n\n\n\n\n","Выбрать","Назад");
		case 2: SPD(playerid,7102,DSL,"Навигатор - Гос.организации","1. Правительство\n2. Офис ФБР\n3. Полицейский департамент\n4. Национальная гвардия \
		\n5. Центральная больница\n6. Радиоцентр\n7. Автошкола","Выбрать","Назад");
		case 3: SPD(playerid,7103,DSL,"Навигатор - Нелегальные организации","1. Мафия 1\n2. Мафия 2\n3. Мафия 3\n4. Мафия 4\n5. Мафия 5","Выбрать","Назад");
		case 4: SPD(playerid,7104,DSL,"Навигатор - По работе","1. Грузчики\n2. Ферма\n3. \n\n\n\n\n8. Аренда рабочего транспорта\n\n\n\n","Выбрать","Назад");
		case 5: SPD(playerid,7105,DSL,"Навигатор - Развлечения","1. Стадион\n2. \n3. \n4. \n5. ","Выбрать","Назад");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogDir(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,55,DSL,"Справочник","1. О проекте\n2. Телефонная книга\n3. Важные номера\n4. Мои заметки\n5. Адвокаты","Выбрать","Закрыть");
		case 1: SPD(playerid,56,DSM,"О проекте","dferhj","Далее","Назад");
		case 2: SPD(playerid,57,DSTH,"Телефонная книга","qwdefrth","Выбрать","Назад");
		case 3: SPD(playerid,58,DSTH,"Важные номера","wfertn","Далее","Назад");
		case 4: SPD(playerid,59,DSL,"Мои заметки","wergt","Далее","Назад");
		case 5: SPD(playerid,60,DSTH,"Адвокаты","dfghn","Далее","Назад");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogBank(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,400,DSL,"Банковская карта","1. Информация о банковском счете\n2. Пополнить баланс\n3. Снять с баланса \
					\n4. Перевести денежные средства\n4. Информация о депозите\n5. Пополнить депозит\n6. Снять с депозита \
					\n7. Благотворительность\n8. Сменить PIN-код","Выбрать","Закрыть");
		case 1: SPD(playerid,401,DSM,"Информация о банковском счете","rg","Назад","Закрыть");
		case 2: SPD(playerid,402,DSI,"Пополнить баланс","Введите сумму, на которую вы желаете пополнить свой банковский счет","Далее","Назад");
		case 3: SPD(playerid,403,DSI,"Снять с баланса","Введите сумму, которую желаете снять со своего банковского счета","Далее","Назад");
		case 4: SPD(playerid,404,DSI,"Перевести денежные средства","Введите сумму, которую желаете перевести ","Далее","Назад");
		case 5: SPD(playerid,405,DSM,"Информация о депозите","","Назад","Закрыть");
		case 6: SPD(playerid,406,DSM,"Пополнить депозит","","Далее","Назад");
		case 7: SPD(playerid,407,DSM,"Снять с депозита","Введите сумму, которую желаете снять с депозита","Далее","Назад");
		case 8: SPD(playerid,408,DSM,"","","","");
		case 9: SPD(playerid,409,DSM,"","","","");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogLmenu(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,262,DSL,"Меню организации","1. Статистика организации\n2. Члены организации онлайн\n3. Члены организации оффлайн \
					\n4. \n5. ","Выбрать","Закрыть");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogCmenu(playerid,row,carID) {
	switch(row) {
		case 0: { format(string,sizeof(string),"Действие\tСтатус\n1. Завести/заглушить двигатель\t%b\n2. Открыть/закрыть капот\t%b \
				  \n3. Открыть/закрыть багажник\t%b\n4. Включить/выключить фары\t%b",vehicleVariable[carID][vEngine],vehicleVariable[carID][vBonnet],
				  vehicleVariable[carID][vBoot],vehicleVariable[carID][vLights]);
			  	  SPD(playerid,62,DST,"Меню транспорта",string,"Выбрать","Закрыть"); }
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogQuests(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,555,DSL,"{FFD700}Квесты","{FFD700}1. {FFFFFF}Паспорт\n{FFD700}2. {FFFFFF}Грузчики\n{FFD700}3. \
		  {FFFFFF}Вод.права\n{FFD700}4. {FFFFFF}Такси\n{FFD700}5. {FFFFFF}Автобус\n{FFD700}6. {FFFFFF}Одежда\n{FFD700}7. {FFFFFF}Дом",
		  "Выбрать","Закрыть");
		case 1: SPD(playerid,556,DSM,"Квест","dwerety","Принять","Назад");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogAhelp(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,5003,DSTH,"Команды администратора 1-ого уровня","Команда\tДействие\n1. /alogin\tАвторизация админ-панель\n2. /ahelp\tКоманды администратора\n\
		3. /apanel\tПанель адмиинистратора\n4. /reports\tСписок запросов помощи","Далее","Закрыть");
		case 1: SPD(playerid,5004,DSTH,"Команды администратора 2-ого уровня","erty","Далее","Назад");
		case 2: SPD(playerid,5005,DSTH,"Команды администратора 3-ого уровня","erty","Далее","Назад");
		case 3: SPD(playerid,5006,DSTH,"Команды администратора 4-ого уровня","erty","Далее","Назад");
		case 4: SPD(playerid,5007,DSTH,"Команды администратора 5-ого уровня","erty","Далее","Назад");
		case 5: SPD(playerid,5008,DSTH,"Команды администратора 6-ого уровня","erty","Далее","Назад");
		case 6: SPD(playerid,5009,DSTH,"Команды администратора 7-ого уровня","erty","Далее","Назад");
		case 7: SPD(playerid,5010,DSTH,"Команды администратора 8-ого уровня","erty","Закрыть","Назад");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogApanel(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,501,DSL,"Админ-меню","1. Статистика\n2. Администраторы онлайн\n3. Репорты\n4. \n5. \n6. \n7. \n8. \n9. Редактор МП\n10. Изъять дом \
		\n11. Изъять бизнес","Выбрать","Закрыть");
		case 1: SPD(playerid,502,DSM,"Статистика","",ButtonBack,ButtonExit);
		case 3: SPD(playerid,504,DSL,"Репорты","",ButtonSelect,ButtonBack);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogRadio(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7000,DSL,"Выберите радиостанцию","1. Выключить радио\n2. Mafia FM\n3. Radio Record\n4. Europa Plus\n5. DFM \n6. Хит FM\n7. Energy FM \
		\n8. Новое Радио\n9. Like FM\n10. Русское радио\n11. Юмор FM\n12. Радио Мир\n13. Авторадио \
		\n14. Дорожное радио\n15. Зайцев FM\n16. Радио Монте-Карло\n17. Радио Милицейская волна \
		\n18. Радио Дача\n19. Ретро FM\n20. Наше Радио\n21. Радио Шансон\n22. Вести FM","Выбрать","Закрыть");
		case 1: { SCM(playerid,WHITE,"Радио выключено"); StopAudioStreamForPlayer(playerid); }
		case 2: PlayAudioStreamForPlayer(playerid,RadioMafia);
		case 3: DialogRadioRecord(playerid,0);
		case 4: DialogRadioEuropa(playerid,0);
		case 5: DialogRadioDFM1(playerid,0);
		case 17: DialogRadioZaycev(playerid,0);
		case 19: DialogRadioMonteCarlo(playerid,0);
	}
	return 1;
}

static stock DialogRadioRecord(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7003,DSL,"Радио Рекорд","1. \n2. \n3. \n4. \n5. \n6. \n7. \n8.","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioRecord);
	}
	return 1;
}

static stock DialogRadioEuropa(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7004,DSL,"Радио Европа Плюс","1. Main\n2. Top 40\n3. New\n4. Party\n5. Light\n6. Urban","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioEuropa);
		case 2: PlayAudioStreamForPlayer(playerid,RadioEuropaTop40);
		case 3: PlayAudioStreamForPlayer(playerid,RadioEuropaNew);
		case 4: PlayAudioStreamForPlayer(playerid,RadioEuropaParty);
		case 5: PlayAudioStreamForPlayer(playerid,RadioEuropaLight);
		case 6: PlayAudioStreamForPlayer(playerid,RadioEuropaUrban);
	}
	return 1;
}



static stock DialogRadioDFM1(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7005,DSL,"Радио DFM","1. DFM\n2. DanceHall\n3. Insomnia\n4. Deep\n5. Russian Dance \n6. Gangsta Deep\n7. Russian Rave \
		\n8. Party\n9. BassSlap\n10. Disco 1990\n11. Armin Van Buuren\n12. Avicii\n13. David Guetta\n14. Tiesto \
		\n15. The Prodigy\n16. Swedish House Mafia\n17. Calvin Harris\n18. Martin Garrix\n19. Skrillex\n20. Chill\nСледующая страница","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioDFM);
		case 2: PlayAudioStreamForPlayer(playerid,RadioDFMDanceHall);
		case 3: PlayAudioStreamForPlayer(playerid,RadioDFMInsomnia);
		case 4: PlayAudioStreamForPlayer(playerid,RadioDFMDeep);
		case 5: PlayAudioStreamForPlayer(playerid,RadioDFMRussianDance);
		case 6: PlayAudioStreamForPlayer(playerid,RadioDFMGangstaDeep);
		case 7: PlayAudioStreamForPlayer(playerid,RadioDFMRussianRave);
		case 8: PlayAudioStreamForPlayer(playerid,RadioDFMParty);
		case 9: PlayAudioStreamForPlayer(playerid,RadioDFMBassSlap);
		case 10: PlayAudioStreamForPlayer(playerid,RadioDFMDisco90);
		case 11: PlayAudioStreamForPlayer(playerid,RadioDFMArminVanBuuren);
		case 12: PlayAudioStreamForPlayer(playerid,RadioDFMAvicii);
		case 13: PlayAudioStreamForPlayer(playerid,RadioDFMDavidGuetta);
		case 14: PlayAudioStreamForPlayer(playerid,RadioDFMTiesto);
		case 15: PlayAudioStreamForPlayer(playerid,RadioDFMTheProdigy);
		case 16: PlayAudioStreamForPlayer(playerid,RadioDFMSwedishHouseMafia);
		case 17: PlayAudioStreamForPlayer(playerid,RadioDFMCalvinHarris);
		case 18: PlayAudioStreamForPlayer(playerid,RadioDFMMartinGarrix);
		case 19: PlayAudioStreamForPlayer(playerid,RadioDFMSkrillex);
		case 20: PlayAudioStreamForPlayer(playerid,RadioDFMChill);
		case 21: DialogRadioDFM2(playerid,0);
	}
	return 1;
}

static stock DialogRadioDFM2(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7006,DSL,"Радио DFM","Предыдущая страница\n21. Dance Gold 1990\n22. Dance Gold 2000\n23. Dance Gold 2010\n24. Dance Gold 2020 \
		\n25. Remake\n26. Pop Gold 1990\n27. Pop Gold 2000\n28. Pop Gold 2010\n29. Pop Gold 2020\n30. K-Pop \
		\n31. Festival Gold\n32. Club\n33. Bass House\n34. Organic House\n35. Tech House\n36. Russian Gold\n37. Sad Dance\n38. Rap\n39. Kalian Rap\n40. Pop Dance\nСледующая страница","Выбрать","Назад");
		case 1: DialogRadioDFM1(playerid,0);
 		case 2: PlayAudioStreamForPlayer(playerid,RadioDFMDanceGold1990);
		case 3: PlayAudioStreamForPlayer(playerid,RadioDFMDanceGold2000);
		case 4: PlayAudioStreamForPlayer(playerid,RadioDFMDanceGold2010);
		case 5: PlayAudioStreamForPlayer(playerid,RadioDFMDanceGold2020);
		case 6: PlayAudioStreamForPlayer(playerid,RadioDFMRemake);
		case 7: PlayAudioStreamForPlayer(playerid,RadioDFMPopGold1990);
		case 8: PlayAudioStreamForPlayer(playerid,RadioDFMPopGold2000);
		case 9: PlayAudioStreamForPlayer(playerid,RadioDFMPopGold2010);
		case 10: PlayAudioStreamForPlayer(playerid,RadioDFMPopGold2020);
		case 11: PlayAudioStreamForPlayer(playerid,RadioDFMKPop);
		case 12: PlayAudioStreamForPlayer(playerid,RadioDFMFestivalGold);
		case 13: PlayAudioStreamForPlayer(playerid,RadioDFMClub);
		case 14: PlayAudioStreamForPlayer(playerid,RadioDFMBassHouse);
		case 15: PlayAudioStreamForPlayer(playerid,RadioDFMOrganicHouse);
		case 16: PlayAudioStreamForPlayer(playerid,RadioDFMTechHouse);
		case 17: PlayAudioStreamForPlayer(playerid,RadioDFMRussianGold);
		case 18: PlayAudioStreamForPlayer(playerid,RadioDFMSadDance);
		case 19: PlayAudioStreamForPlayer(playerid,RadioDFMRap);
		case 20: PlayAudioStreamForPlayer(playerid,RadioDFMKalianRap);
		case 21: PlayAudioStreamForPlayer(playerid,RadioDFMPopDance);
		case 22: DialogRadioDFM3(playerid,0);
	}
	return 1;
}

static stock DialogRadioDFM3(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7007,DSL,"Радио DFM","Предыдущая страница\n41. Vocal Trance\n42. Psy Trance\n43. Hands Up\n44. Trap\n45. Future Bass\n46. Vocal Drum\n47. Liquid Funk\n48. Pump\n49. BreakBeat\n50. Disco","Выбрать","Назад");
	    case 1: DialogRadioDFM2(playerid,0);
		case 2: PlayAudioStreamForPlayer(playerid,RadioDFMVocalTrance);
		case 3: PlayAudioStreamForPlayer(playerid,RadioDFMPsyTrance);
		case 4: PlayAudioStreamForPlayer(playerid,RadioDFMHandsUp);
		case 5: PlayAudioStreamForPlayer(playerid,RadioDFMTrap);
		case 6: PlayAudioStreamForPlayer(playerid,RadioDFMFutureBass);
		case 7: PlayAudioStreamForPlayer(playerid,RadioDFMVocalDrum);
		case 8: PlayAudioStreamForPlayer(playerid,RadioDFMLiquidFunk);
		case 9: PlayAudioStreamForPlayer(playerid,RadioDFMPump);
		case 10: PlayAudioStreamForPlayer(playerid,RadioDFMBreakBeat);
		case 11: PlayAudioStreamForPlayer(playerid,RadioDFMDisco);
	}
	return 1;
}

static stock DialogRadioHitFM(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7008,DSL,"Радио Хит FM","1. Hit FM\n2. Smart Pop\n3. Soft Rock 1990\n4. Soft Rock 2000\n5. Soft Rock 2010\n6. Positive \
		\n7. Dance 1990\n8. Dance 2000\n9. Dance 2010\n10. Party\n11. Hip-Hop\n12. Ballads","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioHitFM);
		case 2: PlayAudioStreamForPlayer(playerid,RadioHitFMSmartPop);
		case 3: PlayAudioStreamForPlayer(playerid,RadioHitFMSoftRock1990);
		case 4: PlayAudioStreamForPlayer(playerid,RadioHitFMSoftRock2000);
		case 5: PlayAudioStreamForPlayer(playerid,RadioHitFMSoftRock2010);
		case 6: PlayAudioStreamForPlayer(playerid,RadioHitFMPositive);
		case 7: PlayAudioStreamForPlayer(playerid,RadioHitFMDance1990);
		case 8: PlayAudioStreamForPlayer(playerid,RadioHitFMDance2000);
		case 9: PlayAudioStreamForPlayer(playerid,RadioHitFMDance2010);
		case 10: PlayAudioStreamForPlayer(playerid,RadioHitFMParty);
		case 11: PlayAudioStreamForPlayer(playerid,RadioHitFMHipHop);
		case 12: PlayAudioStreamForPlayer(playerid,RadioHitFMBallads);
	}
}

static stock DialogRadioZaycev(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7017,DSL,"Радио Зайцев FM","1. Pop\n2. Disco\n3. Club\n4. New Rock\n5. RnB\n6. Шансон\n7. Russian\n8. Relax \
		\n9. Kids\n10. K-Pop\n11. Rap\n12. Metal\n13. New Yaer\n14. Dubstep\n15. Love\n16. Russian Rock\n17. Folk Rock\n18. Classic","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioZaycevPop);
		case 2: PlayAudioStreamForPlayer(playerid,RadioZaycevDisco);
		case 3: PlayAudioStreamForPlayer(playerid,RadioZaycevClub);
		case 4: PlayAudioStreamForPlayer(playerid,RadioZaycevNewRock);
		case 5: PlayAudioStreamForPlayer(playerid,RadioZaycevRNB);
		case 6: PlayAudioStreamForPlayer(playerid,RadioZaycevChanson);
		case 7: PlayAudioStreamForPlayer(playerid,RadioZaycevRus);
		case 8: PlayAudioStreamForPlayer(playerid,RadioZaycevRelax);
		case 9: PlayAudioStreamForPlayer(playerid,RadioZaycevKids);
		case 10: PlayAudioStreamForPlayer(playerid,RadioZaycevKPop);
		case 11: PlayAudioStreamForPlayer(playerid,RadioZaycevRap);
		case 12: PlayAudioStreamForPlayer(playerid,RadioZaycevMetal);
		case 13: PlayAudioStreamForPlayer(playerid,RadioZaycevNewYear);
		case 14: PlayAudioStreamForPlayer(playerid,RadioZaycevBass);
		case 15: PlayAudioStreamForPlayer(playerid,RadioZaycevLove);
		case 16: PlayAudioStreamForPlayer(playerid,RadioZaycevRusRock);
		case 17: PlayAudioStreamForPlayer(playerid,RadioZaycevFolkRock);
		case 18: PlayAudioStreamForPlayer(playerid,RadioZaycevClassic);
	}
	return 1;
}

static stock DialogRadioMonteCarlo(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,7018,DSL,"Радио Монте-Карло","1. \n2. \n3. \n4. \n5. \n6. \n7. \n8.","Выбрать","Назад");
		case 1: PlayAudioStreamForPlayer(playerid,RadioMonteCarlo);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock DialogJobLoader(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,32000,DSL,"Грузчик","","Дадее","Закрыть");
		case 1: SPD(playerid,32000,DSM,"Грузчик","","Назад","Закрыть");
		case 2: SPD(playerid,32000,DSM,"Грузчик","","Назад","Закрыть");
	}
	return 1;
}

static stock DialogFamilyMenu(playerid,row) {
	switch(row) {
		case 0: SPD(playerid,0,DSL,"Управление семьей","1. Информатия о семье\n2. Члены семьи онлайн\n3. Члены семьеи оффлайн\n4. Изменить цвет семьи \
				\n5. \n6. \n7. \n8. ",ButtonSelect,ButtonExit);
		case 1: SPD(playerid,0,DSM,"Информация о семье","Название семьи: %s\nСтатус семьи: %s\nКол-во членов семьи: %i\n\n",ButtonBack,ButtonExit);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////









////////////////////////////////////////////////////////////////////////////////

static stock ProxDetector(playerid,Float:radius,str[],color1,color2,color3,color4,color5) {
    new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid,X,Y,Z);
    
    foreach(new i:Player) {
		if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)) {
			new Float:position = GetPlayerDistanceFromPoint(i,X,Y,Z);
			if(position>radius) continue;
  			if(position<(radius/5)*1) SCM(i,color1,str);
			else if(position<(radius/5)*2) SCM(i,color2,str);
			else if(position<(radius/5)*3) SCM(i,color3,str);
			else if(position<(radius/5)*4) SCM(i,color4,str);
			else if(position<(radius/5)*5) SCM(i,color5,str);
		}
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock OpenInventory(playerid) {
	return 1;
}

static stock CloseInventory(playerid) {
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock ShowGangZones(playerid) {
	for(new i = 0; i < MAX_GANGZONES; ++i) {
		GangZoneShowForPlayer(playerid,gangZones[i],0x0000FF66);//familyVariable[gangVariable[i][gFamID]][fColor]);
	}
	GangZoneShowForAll(zone1,0xFF0000AA);
	GangZoneShowForAll(zone2,0xFF0000AA);
	GangZoneShowForAll(zone3,0xFF0000AA);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CreateGlobalTextDraws() {
	SBox = TextDrawCreate(626.0,384.54,"usebox");
	TextDrawLetterSize(SBox,0.0,5.9);
	TextDrawTextSize(SBox,430.8,0.0);
	TextDrawAlignment(SBox,1);
	TextDrawColor(SBox,0);
	TextDrawUseBox(SBox,true);
	TextDrawBoxColor(SBox,102);
	TextDrawSetShadow(SBox,0);
	TextDrawSetOutline(SBox,0);
	TextDrawFont(SBox,0);

	SBox1 = TextDrawCreate(601.875,383.2,"LD_SPAC:white");
	TextDrawLetterSize(SBox1,0.0,0.0);
	TextDrawTextSize(SBox1,21.25,57.16);
	TextDrawAlignment(SBox1,1);
	TextDrawColor(SBox1,255);
	TextDrawSetShadow(SBox1,0);
	TextDrawSetOutline(SBox1,0);
	TextDrawFont(SBox1,4);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CreatePlayersTextDraw(playerid) {
    CarSpeed[playerid] = CreatePlayerTextDraw(playerid,442.4,386.026580,"SPEED: 100");
    PlayerTextDrawLetterSize(playerid,CarSpeed[playerid],0.401249,1.430832);
    PlayerTextDrawAlignment(playerid,CarSpeed[playerid],1);
    PlayerTextDrawColor(playerid,CarSpeed[playerid],-1);
    PlayerTextDrawSetShadow(playerid,CarSpeed[playerid],0);
    PlayerTextDrawSetOutline(playerid,CarSpeed[playerid],1);
    PlayerTextDrawBackgroundColor(playerid,CarSpeed[playerid],51);
    PlayerTextDrawFont(playerid,CarSpeed[playerid],1);
    PlayerTextDrawSetProportional(playerid,CarSpeed[playerid],1);

    CarFuel[playerid] = CreatePlayerTextDraw(playerid, 442.149963, 401.026672, "FUEL: 1000");
    PlayerTextDrawLetterSize(playerid,CarFuel[playerid],0.401249,1.430832);
    PlayerTextDrawAlignment(playerid,CarFuel[playerid],1);
    PlayerTextDrawColor(playerid,CarFuel[playerid],-1);
    PlayerTextDrawSetShadow(playerid,CarFuel[playerid],0);
    PlayerTextDrawSetOutline(playerid,CarFuel[playerid],1);
    PlayerTextDrawBackgroundColor(playerid,CarFuel[playerid],51);
    PlayerTextDrawFont(playerid,CarFuel[playerid],1);
    PlayerTextDrawSetProportional(playerid,CarFuel[playerid],1);

    CarMilliage[playerid] = CreatePlayerTextDraw(playerid,441.899963,416.610015,"MILLIAGE: 10000");
    PlayerTextDrawLetterSize(playerid,CarMilliage[playerid],0.401249,1.430832);
    PlayerTextDrawAlignment(playerid,CarMilliage[playerid],1);
    PlayerTextDrawColor(playerid,CarMilliage[playerid],-1);
    PlayerTextDrawSetShadow(playerid,CarMilliage[playerid],0);
    PlayerTextDrawSetOutline(playerid,CarMilliage[playerid],1);
    PlayerTextDrawBackgroundColor(playerid,CarMilliage[playerid],51);
    PlayerTextDrawFont(playerid,CarMilliage[playerid],1);
    PlayerTextDrawSetProportional(playerid,CarMilliage[playerid],1);

    CarLights[playerid] = CreatePlayerTextDraw(playerid,608.125000,386.166625,"L");
    PlayerTextDrawLetterSize(playerid,CarLights[playerid],0.449999,1.600000);
    PlayerTextDrawAlignment(playerid,CarLights[playerid],1);
    PlayerTextDrawColor(playerid,CarLights[playerid],-1);
    PlayerTextDrawSetShadow(playerid,CarLights[playerid],0);
    PlayerTextDrawSetOutline(playerid,CarLights[playerid],1);
    PlayerTextDrawBackgroundColor(playerid,CarLights[playerid],51);
    PlayerTextDrawFont(playerid,CarLights[playerid],1);
    PlayerTextDrawSetProportional(playerid,CarLights[playerid],1);

    CarEngine[playerid] = CreatePlayerTextDraw(playerid,609.125000,413.416778,"E");
    PlayerTextDrawLetterSize(playerid,CarEngine[playerid],0.449999,1.600000);
    PlayerTextDrawAlignment(playerid,CarEngine[playerid],1);
    PlayerTextDrawColor(playerid,CarEngine[playerid],-1);
    PlayerTextDrawSetShadow(playerid,CarEngine[playerid],0);
    PlayerTextDrawSetOutline(playerid,CarEngine[playerid],1);
    PlayerTextDrawBackgroundColor(playerid,CarEngine[playerid],51);
    PlayerTextDrawFont(playerid,CarEngine[playerid],1);
    PlayerTextDrawSetProportional(playerid,CarEngine[playerid],1);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SpeedVehicle(playerid) {
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]),2.0)+floatpower(floatabs(ST[1]),2.0)+floatpower(floatabs(ST[2]),2.0))*100.3;
    return floatround(ST[3]);
}

////////////////////////////////////////////////////////////////////////////////

static stock ClearVehicle(vehicleid) {
	vehicleVariable[vehicleid][vEngine]=false;
	vehicleVariable[vehicleid][vLights]=false;
	vehicleVariable[vehicleid][vAlarm]=false;
	vehicleVariable[vehicleid][vDoors]=false;
	vehicleVariable[vehicleid][vBonnet]=false;
	vehicleVariable[vehicleid][vBoot]=false;
	vehicleVariable[vehicleid][vObjective]=false;
	vehicleVariable[vehicleid][vFuel]=FUEL_IN_CAR;
	vehicleVariable[vehicleid][vTurnLeft]=false;
	vehicleVariable[vehicleid][vTurnRight]=false;
	vehicleVariable[vehicleid][vLeftID1]=EOS;
	vehicleVariable[vehicleid][vLeftID2]=EOS;
	vehicleVariable[vehicleid][vRightID1]=EOS;
	vehicleVariable[vehicleid][vRightID2]=EOS;
	SetVehicleParams(vehicleid);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock IsForbiddenVehicle(vehicleid) {
    if( vehicleid==594 || vehicleid==592 || vehicleid==590 || vehicleid==584 || vehicleid==577 || vehicleid==570 ||
		vehicleid==569 || vehicleid==564 || vehicleid==553 || vehicleid==538 || vehicleid==537 || vehicleid==532 ||
		vehicleid==520 || vehicleid==501 ||	vehicleid==464 || vehicleid==449 || vehicleid==441 || vehicleid==432 ||
		vehicleid==430 || vehicleid==425 || vehicleid==406) return 1;
	return 0;
}

////////////////////////////////////////////////////////////////////////////////

static stock Float:PlayerToPlayer(playerid1,playerid2) {
	new Float:X1,Float:Y1,Float:Z1,Float:X2,Float:Y2,Float:Z2;
	GetPlayerPos(playerid1,X1,Y1,Z1);
	GetPlayerPos(playerid2,X2,Y2,Z2);
	return floatsqroot(floatpower(floatabs(floatsub(X1,X2)),2)+floatpower(floatabs(floatsub(Y1,Y2)),2)+floatpower(floatabs(floatsub(Z1,Z2)),2));
}

static stock Float:PlayerToPoint(playerid,Float:X2,Float:Y2,Float:Z2) {
	new Float:X1,Float:Y1,Float:Z1;
	GetPlayerPos(playerid,X1,Y1,Z1);
	return floatsqroot(floatpower(floatabs(floatsub(X1,X2)),2)+floatpower(floatabs(floatsub(Y1,Y2)),2)+floatpower(floatabs(floatsub(Z1,Z2)),2));
}

static stock Float:PointToPoint(Float:X1,Float:Y1,Float:Z1,Float:X2,Float:Y2,Float:Z2) {
    return floatsqroot(floatpower(floatabs(floatsub(X1,X2)),2)+floatpower(floatabs(floatsub(Y1,Y2)),2)+floatpower(floatabs(floatsub(Z1,Z2)),2));
}

////////////////////////////////////////////////////////////////////////////////

static stock ChangeMoney(playerid,money) {
	playerVariable[playerid][pCash] += money;
	GivePlayerMoney(playerid,playerVariable[playerid][pCash]);
	SaveVariableInteger("account","Cash",playerVariable[playerid][pCash],playerVariable[playerid][pID]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SaveVariableInteger(table[],column[],variable,ID) {
	query[0] = EOS;
	format(query,sizeof(query),"UPDATE `%s` SET `%s` = '%i' WHERE `ID` = '%i'",table,column,variable,ID);
	mysql_tquery(MySQL:DATABASE,query);
	printf("%s",query);
}

////////////////////////////////////////////////////////////////////////////////

static stock SaveVariableString(table[],column[],variable[],ID) {
	query[0] = EOS;
	format(query,sizeof(query),"UPDATE `%s` SET `%s` = '%s' WHERE `ID` = '%i'",table,column,variable,ID);
	mysql_tquery(MySQL:DATABASE,query);
	printf("%s",query);
}

////////////////////////////////////////////////////////////////////////////////

static stock SaveVariableBool(table[],column[],bool:variable,ID) {
	query[0] = EOS;
	format(query,sizeof(query),"UPDATE `%s` SET `%s` = '%b' WHERE `ID` = '%i'",table,column,variable,ID);
	mysql_tquery(MySQL:DATABASE,query);
	printf("%s",query);
}

////////////////////////////////////////////////////////////////////////////////

static stock LoggingAdminAction(playerid,action[],command[],intruderid,punishTime=0,punishReason[]="") {
	new intruderID;
	new intruderNickName[25];
	
	if(intruderid == -1) {
		intruderID = 0;
		strcat(intruderNickName,"");
	} else {
		intruderID = playerVariable[intruderid][pID];
		strcat(intruderNickName,playerVariable[intruderid][pName]);
	}
	format(query,512,"INSERT INTO `logs_admin` (`AdminID`, `AdminNickName`, `Action`, `Command`, `IntruderID`, `IntruderNickName`, `PunishTime`, `PunishReason`) VALUES ('%i', '%s', '%s', '%s', '%i', '%s', '%i', '%s')",
	playerVariable[playerid][pID],playerVariable[playerid][pName],action,command,intruderID,intruderNickName,punishTime,punishReason);
	mysql_tquery(MySQL:DATABASE,query);
	printf("%s",query);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CheckString(string1[],string2[]) {
	return !strcmp(string1,string2,false);
}

////////////////////////////////////////////////////////////////////////////////

static stock StringReplace(inputvar[],const searchstring[],const replacestring[],bool:ignorecase=true,bool:replaceall=false) {
	if(strfind(replacestring,searchstring,ignorecase)!=-1) return -1;
	new pos=strfind(inputvar,searchstring,ignorecase);
	if(pos==-1) return 0;
	if(replaceall==true) {
		while(strfind(inputvar,searchstring,ignorecase)!=-1) {
			pos = strfind(inputvar,searchstring,ignorecase);
			strdel(inputvar,pos,pos+strlen(searchstring));
			strins(inputvar,replacestring,pos,strlen(inputvar));
		}
	} else {
		strdel(inputvar,pos,pos+strlen(searchstring));
		strins(inputvar,replacestring,pos,strlen(inputvar));
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetEXP(playerid,plusEXP) {
	format(string,sizeof(string),"Вы получили очков опыта: %i",plusEXP);
	SCM(playerid,WHITE,string);
	playerVariable[playerid][pEXP]+=plusEXP;
	SaveVariableInteger("account","EXP",playerVariable[playerid][pEXP],playerVariable[playerid][pID]);
	if(playerVariable[playerid][pEXP]>=((playerVariable[playerid][pLVL]+1)*2)) {
	    playerVariable[playerid][pLVL]+=1;
	    playerVariable[playerid][pEXP]=0;
	    SaveVariableInteger("account","LVL",playerVariable[playerid][pLVL],playerVariable[playerid][pID]);
        SaveVariableInteger("account","EXP",0,playerVariable[playerid][pID]);
	    format(string,sizeof(string),"Поздравляем! Вы достигли нового %i-ого уровня!",playerVariable[playerid][pLVL]);
		SCM(playerid,WHITE,string);
		SetPlayerScore(playerid,playerVariable[playerid][pLVL]);
		return 1;
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetLVLFromEXP(currEXP,bool:get_lvl_=true) {
	new ostatok = currEXP;
	new count_exp = 2;
	new count_lvl = 1;
	while(ostatok > 0) {
	    ostatok -= count_exp;
	    count_exp += 2;
		++count_lvl;
	}
	if(get_lvl_ == true) return count_lvl;
	return count_exp;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetNowDate() {
    new year,month,day,getnow_date[32];
    getdate(year,month,day);
    format(getnow_date,sizeof(getnow_date),"%i %s 1972",day,MonthsEN[month - 1][eValue]);
    return getnow_date;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetNowTime() {
    new hour,minut,second,getnow_time[16];
    gettime(hour,minut,second);
    format(getnow_time,sizeof(getnow_time),"%i:%i:%i",hour,minut,second);
    return getnow_time;
}

////////////////////////////////////////////////////////////////////////////////

static stock GetPlayerDistrict(playerid) {
	if(!IsPlayerConnected(playerid)) return -1;
	if(playerVariable[playerid][pLogged]==false) return -1;
	if(GetPlayerVirtualWorld(playerid)!=0) { format(string,sizeof(string),"%s Игрок находится в интерьере!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
    new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid,X,Y,Z);
    for(new i = 0; i < sizeof(cityDistricts); ++i) {
        if(X>=cityDistricts[i][distPos][0] &&
		X <= cityDistricts[i][distPos][3] &&
		Y >= cityDistricts[i][distPos][1] &&
		Z <= cityDistricts[i][distPos][4]) return i;
    }
	return -1;
}

////////////////////////////////////////////////////////////////////////////////

static stock CheckSeniorAdm(playerid1,playerid2,const command[]) {
	if(playerVariable[playerid1][pAdmin]<=playerVariable[playerid2][pAdmin]) {
	    format(string,sizeof(string),"%s Администратор старше/равен Вам!",PrefixAdmRed);
		SCM(playerid1,WHITE,string);
		format(string,sizeof(string),"%s Администратор %s[%i] попытался использовать команду %s на %s[%i]!",
		PrefixSecurity,playerVariable[playerid1][pName],playerid1,command,playerVariable[playerid2][pName],playerid2);
		SendAdminChat(playerid1,WHITE,string,false);
		return 1;
	}
	return 0;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendToAllChatSettingAdminAction(string_color,const string_string[]) {
	foreach(new i:Player) {
	    if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pSettingsAdminAction]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendToAllChatSettingsAdd(string_color,const string_string1[],const string_string2[]) {
	foreach(new i:Player) {
	    if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pSettingsAdd]==false) continue;
		SCM(i,string_color,string_string1);
		SCM(i,string_color,string_string2);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendToAllChatSettingsBroadcast(string_color,const string_string[]) {
	foreach(new i:Player) {
		if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pSettingsBroadcast]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendAdminChat(playerid,string_color,const string_string[],rank=1,bool:dont_show_to_self=false) {
	foreach(new i:Player) {
	    if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pAdmin]==0) continue;
		if(adminVariable[i][aLogged]==false) continue;
		if(playerVariable[i][pAdmin]<rank) continue;
		if(i==playerid && dont_show_to_self) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendDepartamentChat(string_color,const string_string[]) {
	foreach(new i:Player) {
		if(!(1<=playerVariable[i][pOrgID]<=7)) continue;
		if(playerVariable[i][pSettingsOrgChat]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendOrgChat(orgID_,string_color,const string_string[]) {
	foreach(new i: Player) {
		if(playerVariable[i][pOrgID]!=orgID_) continue;
		if(playerVariable[i][pSettingsOrgChat]==false) continue;
		SCM(i,string_color,string_string);
	}
}

////////////////////////////////////////////////////////////////////////////////

static stock SendFamChat(famID_,string_color,const string_string[]) {
	foreach(new i:Player) {
		if(playerVariable[i][pFamID]!=famID_) continue;
		if(playerVariable[i][pSettingsFamChat]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendJobChat(jobID_,string_color,const string_string[]) {
	foreach(new i:Player) {
		if(playerVariable[i][pJobID]!=jobID_) continue;
		if(playerVariable[i][pSettingsJobChat]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendPremiumChat(string_color, const string_string[]) {
	foeach(new i:Player) {
	    if(playerVariable[i][pStatus]!=1) continue;
	    //if(playerVariable[i][pSettingsPremiumChat]==false) continue;
	    SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendVipChat(string_color,const string_string[]) {
	foreach(new i:Player) {
		if(playerVariable[i][pStatus]!=2) continue;
		if(playerVariable[i][pSettingsVipChat]==false) continue;
		SCM(i,string_color,string_string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendOffer(playerid) {
	format(string,sizeof(string),"%s Нажмите \"Y\" чтобы согласиться, \"N\" чтобы отказаться",PrefixHint);
	SCM(playerid,WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendError(playerid,const command[]) {
	format(string,sizeof(string),"%s К сожалению, произошла непредвиденная ошибка! Тех.администрация уже работает над этим!",PrefixHint);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Команда Mafia Role Play желает Вам хорошего настроения!",PrefixHint);
	SCM(playerid,WHITE,string);
	Warning(playerid,command,"");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SendAdvice(playerid) {
	SCM(playerid,WHITE,"Советуем Вам сделать скрин-шот наказания. Если Вы считаете, что администаротор не прав, то можете оставить жалобу на сайте mafia-rp.su");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock SetVehicleParams(carID) {
	SetVehicleParamsEx(carID,vehicleVariable[carID][vEngine],vehicleVariable[carID][vLights],vehicleVariable[carID][vAlarm],
	vehicleVariable[carID][vDoors],vehicleVariable[carID][vBonnet],vehicleVariable[carID][vBoot],vehicleVariable[carID][vObjective]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock FindNearestVehicle(playerid) {
	new nearestID = -1;
	return nearestID;
}

////////////////////////////////////////////////////////////////////////////////

static stock FindNearestHouse(playerid) {
	new nearestID = -1;
	return nearestID;
}

////////////////////////////////////////////////////////////////////////////////

static stock FindNearestBuisness(playerid) {
	new nearestID = -1;
	return nearestID;
}

////////////////////////////////////////////////////////////////////////////////

static stock Teleport(playerid,Float:posX,Float:posY,Float:posZ,Float:angle,interior,vw) {
	SetPlayerPos(playerid,posX,posY,posZ);
	SetPlayerFacingAngle(playerid,angle);
	SetPlayerInterior(playerid,interior);
	SetPlayerVirtualWorld(playerid,vw);
	SetCameraBehindPlayer(playerid);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock AddActor(aaID,const aaName[],const aaProfession[],Float:aaX,Float:aaY,Float:aaZ,Float:aaAngle) {
	format(actorVariable[aID][aName],sizeof(actorVariables[aName]),aaName);
	format(actorVariable[aID][aProfession],sizeof(actorVariables[aProfession]),aaProfession);
	actorVariable[aaID][aX] = aaX;
	actorVariable[aaID][aY] = aaY;
	actorVariable[aaID][aZ] = aaZ;
	actorVariable[aaID][aAngle] = aaAngle;
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

static stock PayDay(bool:free) {
	new Float:X,Float:Y,Float:Z,
		currDate[32],currTime[16];
	format(currDate,sizeof(currDate),"%s",GetNowDate());
	format(currTime,sizeof(currTime),"%s",GetNowTime());

	new currHour;
	gettime(_,currHour,_);
	SetWorldTime(currHour);

	foreach(new i:Player) {
	    if(playerVariable[i][pPlayedTime]>=15 || free == true) {
		    GetPlayerPos(i,X,Y,Z);
		    PlayerPlaySound(i,5203,X,Y,Z);

			SCM(i,WHITE,"=================== P A Y   D A Y ===================");
			SCM(i,WHITE,currDate);
			SCM(i,WHITE,currTime);

			if(organizationVariable[playerVariable[i][pOrgID]][oSalary][playerVariable[i][pOrgRank]]>0) {
				format(string,sizeof(string),"Зарплата: %i",organizationVariable[playerVariable[i][pOrgID]][oSalary][playerVariable[i][pOrgRank]]);
				SCM(i,WHITE,string);
				playerVariable[i][pBankCash]+=organizationVariable[playerVariable[i][pOrgID]][oSalary][playerVariable[i][pOrgRank]];
			}
			format(string,sizeof(string),"Банковский счёт: %i",playerVariable[i][pBankCash]);
			SCM(i,WHITE,string);
			if(playerVariable[i][pBankDeposit]>0) {
				format(string,sizeof(string),"Процент депозита: %i",playerVariable[i][pBankDeposit]*0.001);
				SCM(i,WHITE,string);
				playerVariable[i][pBankDeposit]+=playerVariable[i][pBankDeposit]*0.001;
				format(string,sizeof(string),"Депозит: %i",playerVariable[i][pBankDeposit]);
				SCM(i,WHITE,string);
			}
			if(playerVariable[i][pFine]>0) {
				format(string,sizeof(string),"Штраф: %i",playerVariable[i][pFine]);
				SCM(i,WHITE,string);
			}
			if(GetEXP(i,1)==0) {
			    format(string,sizeof(string),"Ваш уровень: %i\nВаш опыт: %i/%i",playerVariable[i][pLVL],playerVariable[i][pEXP],(playerVariable[i][pLVL]+1)*2);
				SCM(i,WHITE,string);
			}
			SCM(i,WHITE,"=====================================================");

			playerVariable[i][pPlayedTime]=0;
			SaveVariableInteger("account","PlayedTime",0,playerVariable[i][pID]);
			SaveVariableInteger("account","LVL",playerVariable[i][pLVL],playerVariable[i][pID]);
			SaveVariableInteger("account","EXP",playerVariable[i][pEXP],playerVariable[i][pID]);

			SaveVariableInteger("account","BankCash",playerVariable[i][pBankCash],playerVariable[i][pID]);
			SaveVariableInteger("account","BankDeposit",playerVariable[i][pBankDeposit],playerVariable[i][pID]);
		} else {
			format(string,sizeof(string),"%s Вы не получили зарплату, так как не отыграли на сервере 15 минут!",PrefixHint);
			SCM(i,WHITE,string);
		}
	}
	//PaymentForJob();
	return 1;
}

////////////////////////////////////////////////////////////////////////////////






static stock SetPlayerSkills(playerid) {
	SetPlayerSkillLevel(playerid,0,playerVariable[playerid][pSkillPistol]);
	SetPlayerSkillLevel(playerid,1,playerVariable[playerid][pSkillSDPistol]);
	SetPlayerSkillLevel(playerid,2,playerVariable[playerid][pSkillDesertEagle]);
	SetPlayerSkillLevel(playerid,3,playerVariable[playerid][pSkillShotgun]);
	SetPlayerSkillLevel(playerid,4,playerVariable[playerid][pSkillShotgunSawnoff]);
	SetPlayerSkillLevel(playerid,5,playerVariable[playerid][pSkillShotgunSpas12]);
	SetPlayerSkillLevel(playerid,6,playerVariable[playerid][pSkillUZI]);
	SetPlayerSkillLevel(playerid,7,playerVariable[playerid][pSkillMP5]);
	SetPlayerSkillLevel(playerid,8,playerVariable[playerid][pSkillAK47]);
	SetPlayerSkillLevel(playerid,9,playerVariable[playerid][pSkillM4A1]);
	SetPlayerSkillLevel(playerid,10,playerVariable[playerid][pSkillSniper]);
	return 1;
}


CMD:varsbank(playerid) {
	new string2[256];
	format(string2,sizeof(string2),"playerid - %i\n pBankCard - %b\n pBankPassword - %s\n pBankCash - %i\n pBankDeposit - %i\n pBankCharity - %i",
	playerid,
	playerVariable[playerid][pBankCard],
	playerVariable[playerid][pBankPassword],
	playerVariable[playerid][pBankCash],
	playerVariable[playerid][pBankDeposit],
	playerVariable[playerid][pBankCharity]);
	SPD(playerid,1111,DSM,"INFO",string2,"exit","");
	return 1;
}


CMD:varsfight(playerid) {
	new string2[1000];
	format(string2,sizeof(string2),"playerid - %i\n pSkillStyleNormal - %i\n pSkillStyleBoxing - %i\n pSkillStyleKungfu - %i\n pSkillStyleKneehead - %i\n pSkillStyleGrabkick - %i\n pSkillStyleElbow - %i\n pSkillStyleFight - %i\n pSkillStyleWalking - %i",
	playerid,
	playerVariable[playerid][pSkillStyleNormal],
	playerVariable[playerid][pSkillStyleBoxing],
	playerVariable[playerid][pSkillStyleKungfu],
	playerVariable[playerid][pSkillStyleKneehead],
	playerVariable[playerid][pSkillStyleGrabkick],
	playerVariable[playerid][pSkillStyleElbow],

	playerVariable[playerid][pStyleFight],
	playerVariable[playerid][pStyleWalking]);
	SPD(playerid,1111,DSM,"INFO",string2,"exit","");
	
}


CMD:varsa(playerid) {
	new string2[2000];
	format(string2,sizeof(string2),"playerid - %i\n aID - %s\n aName - %s\n aPassword - %s\n aLVL - %i\n aNameRank - %s\n aRating - %i\n aCountBan - %i\n aCountWarn - %i\n aCountJail - %i\n aCountMute - %i\n aCountKick - %i\n aCountReport - %i",
	adminVariable[playerid][aID],
	adminVariable[playerid][aName],
	adminVariable[playerid][aPassword],
	adminVariable[playerid][aLVL],
	adminVariable[playerid][aNameRank],
	adminVariable[playerid][aRating],
	adminVariable[playerid][aCountBan],
	adminVariable[playerid][aCountWarn],
	adminVariable[playerid][aCountJail],
	adminVariable[playerid][aCountMute],
	adminVariable[playerid][aCountKick],
	adminVariable[playerid][aCountReport]);
	SPD(playerid,1111,DSM,"AINFO",string2,"exit","");
	return 1;
}
CMD:varsb(playerid)
{
	new string2[2000];
	format(string2,sizeof(string2),"playerid - %i\n pID - %i\n pName - %s\n pNowIP - %s\n pAdmin - %i\n pLVL - %i\n pEXP - %i\n pCash - %i\n pSex - %b\n pSkinColor - %b\n pSpawnPlace - %i\n pPhoneNumber - %i\n\n pHeal - %f\n pArmour - %f\n pSatiety - %f\n\n pBan - %i\n pWarn - %i\n pJail - %i\n pMute - %i\n\n pOrgID - %i\n pOrgRank - %i\n pOrgWorking - %b\n pOrgReprimands - %i",
	playerid,
	playerVariable[playerid][pID],
	playerVariable[playerid][pName],
	playerVariable[playerid][pNowIP],
	playerVariable[playerid][pAdmin],
	playerVariable[playerid][pLVL],
	playerVariable[playerid][pEXP],
	playerVariable[playerid][pCash],
	playerVariable[playerid][pSex],
	playerVariable[playerid][pSkinColor],
	playerVariable[playerid][pSpawnPlace],
	playerVariable[playerid][pPhoneNumber],
	playerVariable[playerid][pHeal],
	playerVariable[playerid][pArmour],
	playerVariable[playerid][pSatiety],
	playerVariable[playerid][pBan],
	playerVariable[playerid][pWarn],
	playerVariable[playerid][pJail],
	playerVariable[playerid][pMute],
	playerVariable[playerid][pOrgID],
	playerVariable[playerid][pOrgRank],
	playerVariable[playerid][pOrgWorking],
	playerVariable[playerid][pOrgReprimands]);
	SPD(playerid,1111,DSM,"INFO1",string2,"exit","");
	return 1;
}

CMD:varsc(playerid)
{
	new string2[1000];
	format(string2,sizeof(string2),"playerid - %i\n pJobID - %i\n pJobRank - %i\n pJobWorking - %b\n pFamID - %i\n pFamRank - %i\n pSpouse - %i\n pSearchLVL - %i\n pPrisonTime - %i\n pLaw - %i\n pFine - %i\n pDrugAddiction - %i\n\n\n\n\n\n\n\n\n\n\n\n\n",
	playerid,
	playerVariable[playerid][pJobID],
	playerVariable[playerid][pJobRank],
	playerVariable[playerid][pJobWorking],
	playerVariable[playerid][pFamID],
	playerVariable[playerid][pFamRank],

	playerVariable[playerid][pSpouse],
	playerVariable[playerid][pWantedLevel],
	playerVariable[playerid][pPrisonTime],
	playerVariable[playerid][pLaw],
	playerVariable[playerid][pFine],
	playerVariable[playerid][pDrugAddiction],
	
	playerVariable[playerid][pStatus],
	playerVariable[playerid][pDonat],
	playerVariable[playerid][pQuests],
	playerVariable[playerid][pGuns],
	playerVariable[playerid][pPlayedTime],
	playerVariable[playerid][pPlayedTime],
	playerVariable[playerid][pWhereKnew],
	playerVariable[playerid][pMafiaDebt],
	
	playerVariable[playerid][pSettingsAdminAction],
	playerVariable[playerid][pSettingsAdds],
	playerVariable[playerid][pSettingsBroadcast],
	playerVariable[playerid][pSettingsOrgChat],
	playerVariable[playerid][pSettingsFamChat],
	playerVariable[playerid][pSettingsJobChat],

	playerVariable[playerid][pLogged],
	playerVariable[playerid][pWrongPassword],
	playerVariable[playerid][pInMask],
	playerVariable[playerid][pAFK]);
	SPD(playerid,1111,DSM,"INFO",string2,"exit","");
}





CMD:vehinfo(playerid,params[])
{
	sscanf(params,"i",params[0]);
	new string2[1000];
	format(string2,sizeof(string2),"playerid - %i\n vEngine - %b\n vLights - %b\n vAlarm - %b\n vDoors - %b\n vBoot - %b\n vObjective - %b\n\
	vLock - %b\n vTurnLeft - %b\n vTurnRight - %b\n vLeftID1 - %i\n vLeftID2 - %i\n vRightID1 - %i\n vRightID2 - %i\n vFuel - %i\n vMilliage - %i\n\
	 vX - %f\n vY - %f\n vZ - %f\n\n\n\n",
	playerid,
	vehicleVariable[params[0]][vEngine],
	vehicleVariable[params[0]][vLights],
	vehicleVariable[params[0]][vAlarm],
	vehicleVariable[params[0]][vDoors],
	vehicleVariable[params[0]][vBonnet],
	vehicleVariable[params[0]][vBoot],
	vehicleVariable[params[0]][vObjective],
	vehicleVariable[params[0]][vLock],
	vehicleVariable[params[0]][vTurnLeft],
	vehicleVariable[params[0]][vTurnRight],
	vehicleVariable[params[0]][vLeftID1],
	vehicleVariable[params[0]][vLeftID2],
	vehicleVariable[params[0]][vRightID1],
	vehicleVariable[params[0]][vRightID2],
	vehicleVariable[params[0]][vFuel],
	vehicleVariable[params[0]][vMilliage],
	vehicleVariable[params[0]][vX],
	vehicleVariable[params[0]][vY],
	vehicleVariable[params[0]][vZ]);
	SPD(playerid,1111,DSM,"IFNO",string2,"eixt","");
}





////////////////////////////////////////////////////////////////////////////////

//              P       L       A       Y       E       R

////////////////////////////////////////////////////////////////////////////////

CMD:n(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pMute]>0) return SCM(playerid,WHITE,InMute);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /n [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"(( %s[%i]: %s ))",playerVariable[playerid][pName],playerVariable[playerid][pID],params[0]);
	return ProxDetector(playerid,30.0,string,COLOR_NRP_CHAT,COLOR_NRP_CHAT,COLOR_NRP_CHAT,COLOR_NRP_CHAT,COLOR_NRP_CHAT);
}
ALTX:n("/b");

////////////////////////////////////////////////////////////////////////////////

CMD:s(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pMute]>0) return SCM(playerid,WHITE,InMute);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /s [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s[%i] кричит: %s",playerVariable[playerid][pName],playerVariable[playerid][pID],params[0]);
	return ProxDetector(playerid,60.0,string,WHITE,WHITE,WHITE,WHITE,WHITE);
}
ALTX:s("/shout");

////////////////////////////////////////////////////////////////////////////////

CMD:w(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pMute]>0) return SCM(playerid,WHITE,InMute);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /w [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s[%i] шепчет: %s",playerVariable[playerid][pName],playerVariable[playerid][pID],params[0]);
	return ProxDetector(playerid,10.0,string,LIGHT_GRAY,LIGHT_GRAY,LIGHT_GRAY,LIGHT_GRAY,LIGHT_GRAY);
}
ALTX:w("/whisper");

////////////////////////////////////////////////////////////////////////////////

CMD:sp(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pMute]>0) return SCM(playerid,WHITE,InMute);
	if(playerVariable[playerid][pSpouse]==0) return SCM(playerid,WHITE,HaventSpouse);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /sp [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s %s[%i] : %s",PrefixSpouse,playerVariable[playerid][pName],playerid,params[0]);
	SCM(playerid,WHITE,string);
	SCM(playerVariable[playerid][pSpouse],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:time(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);

	format(string,sizeof(string),"~y~%s~n~%s~n~~g~played time: ~w~%i minutes",GetNowDate(),GetNowTime(),playerVariable[playerid][pPlayedTime]);
	GameTextForPlayer(playerid,string,5000,1);
	return 1;
}
ALTX:time("/t");

////////////////////////////////////////////////////////////////////////////////

CMD:hi(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /hi [ID]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(playerid==params[0]) return SCM(playerid,WHITE,CantUseOnSelf);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) { format(string,sizeof(string),PlayerFarAway); return SCM(playerid,WHITE,string); }
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid,WHITE,NotInCar);
	if(IsPlayerInAnyVehicle(params[0])) { format(string,sizeof(string),"%s Игрок находится в транспорте!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	format(string,70,"%s пожал(а) руку %s",playerVariable[playerid][pName],playerVariable[params[0]][pName]);
	ApplyAnimation(playerid,"GANGS","hndshkfa",4.0,0,0,0,0,0,1);
	ApplyAnimation(params[0],"GANGS","hndshkfa",4.0,0,0,0,0,0,1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:me(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pMute]!=0) return SCM(playerid,WHITE,InMute);
    if(sscanf(params,"s[70]",params[1])) { format(string,sizeof(string),"%s Используйте: /me [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
    
    format(string,170,"%s %s",playerVariable[playerid][pName],params);
    return ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
}

////////////////////////////////////////////////////////////////////////////////

CMD:do(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pMute]!=0) return SCM(playerid,WHITE,InMute);
    if(sscanf(params,"s[70]",params[1])) { format(string,sizeof(string),"%s Используйте: /do [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
    
    format(string,170,"%s | %s",params,playerVariable[playerid][pName]);
    return ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
}

////////////////////////////////////////////////////////////////////////////////

CMD:try(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pMute]!=0) return SCM(playerid,WHITE,InMute);
    if(sscanf(params,"s[70]",params[1])) { format(string,sizeof(string),"%s Используйте: /try [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
    
    if(random(2)==0) format(string,170,"%s %s | {00FF00}Удачно",playerVariable[playerid][pName],params);
    else format(string,170,"%s %s | {FF0000}Неудачно",playerVariable[playerid][pName],params);
    return ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
}

////////////////////////////////////////////////////////////////////////////////

CMD:id(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /id [ID]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
    
    foreach(new i: Player) {
		if(!IsPlayerConnected(i)) continue;
		if(IsPlayerNPC(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(i==params[0]) { format(string,sizeof(string),"%s[%i] | Ping: %i | AFK: %i",playerVariable[i][pName],i,GetPlayerPing(i),playerVariable[i][pAFK]); SCM(playerid,WHITE,string); }
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:mm(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	DialogMenu(playerid,0);
	return 1;
}
ALTX:mm("/mn","/menu","/main","/mainmenu");

////////////////////////////////////////////////////////////////////////////////

CMD:setspawn(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,string);
	SPD(playerid,30,DSL,"Выберите место спавна","1. Аэропорт\n2. Дом\n3. Организация\n4. Дом семьи\n5. Трейлер","Выбрать","Закрыть");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:settings(playerid,params[]) {
	SPD(playerid,1,DSL,"Настройки","1.2.3.4.5.","Выбрать","Закрыть");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:pass(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /pass [ID]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	
	format(string,sizeof(string),"%s Вы желаете показать свой паспорт игроку %s[%i].",
	PrefixHint,playerVariable[params[0]][pName],playerVariable[params[0]][pID]);
	SCM(playerid,WHITE,string);
	
	format(string,sizeof(string),"%s Игрок %s[%i] желает показать Вам свой паспорт. Нажмите Y если Вы согласны. В ином случае нажмите N.",
	PrefixHint,playerVariable[playerid][pName],playerVariable[playerid][pID]);
	SCM(params[0],WHITE,string);
	
	// if Y ()
	format(string,sizeof(string),"%s показал(а) %s свой паспорт",
	playerVariable[playerid][pName],playerVariable[params[0]][pName]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	//SPD(params[0],);
	//else
	format(string,sizeof(string),"%s Вы показали свой паспорт игроку %s[%i].",
	PrefixHint,playerVariable[params[0]][pName],playerid);
	SCM(playerid,WHITE,string);
	
	format(string,sizeof(string),"%s Игрок %s[%i] показал Вам свой паспорт.",
	PrefixHint,playerVariable[playerid][pName],playerid);
	SCM(params[0],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:lic(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /lic [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	new title[128];
	format(title,sizeof(title),"Лицензии игрока %s[%i]",playerVariable[playerid][pName],playerid);
	format(string,sizeof(string),
	"Лицензия на авто: \t\t%s\nЛицензия на мото: \t\t%s\nЛицензия на водный т/с: \t%s\nЛицензия на воздушный т/с: \t%s\nЛицензия на оружие: \t\t%s\n",
	playerVariable[playerid][pLicAuto],playerVariable[playerid][pLicMoto],playerVariable[playerid][pLicShip],playerVariable[playerid][pLicAir],
	playerVariable[playerid][pLicGun]);
	StringReplace(string,"1","имеется");
	StringReplace(string,"0","отсутствует");
	SPD(params[0],36,DSM,title,string,"Закрыть","");
	format(string,sizeof(string),"%s[%i] показал(а) %s[%i] свой пакет лицензий",
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:medcard(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}ADM{FFFFFF}] Используйте: /medcard [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[playerid][pMedcard]==0) SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет медкарты!");
	else
	{
		new title[128];
		format(title,sizeof(title),"Медицинская карта игрока %s[%i]",playerVariable[playerid][pName],playerid);
		format(string,sizeof(string),"Мед карта %s[%i] доступна: %i дней",playerVariable[playerid][pName],playerid,playerVariable[playerid][pMedcard]);
		SPD(params[0],39,DSM,title,string,"Закрыть","");
		format(string,sizeof(string),"%s[%i] показал(а) %s[%i] свою медкарту");
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:joblist(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /joblist [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	
	format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] Вы желаете показать свою трудовую книгу игроку %s[%i].",
	playerVariable[playerid][pName],playerid);
	SCM(playerid,WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:skill(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /skill [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок слишком далеко от Вас!");
	new title[128];
	format(title,sizeof(title),"Навыки %s[%i]",playerVariable[playerid][pName],playerid);
	format(string,sizeof(string),"Pistol: \t\t\t%i/1000\nSD Pistol: \t\t%i/1000\nDesert Eagle: \t\t%i/1000\nShotgun: \t\t%i/1000\nShotgun Sawnoff: \t%i/1000\nShotgun Spas12: \t%i/1000\nUZI: \t\t\t%i/1000\nMP5: \t\t\t%i/1000\nAK-47: \t\t\t%i/1000\nM4A1: \t\t\t%i/1000\nSniper: \t\t%i/1000\n",
	playerVariable[playerid][pSkillPistol],playerVariable[playerid][pSkillSDPistol],playerVariable[playerid][pSkillDesertEagle],
	playerVariable[playerid][pSkillShotgun],playerVariable[playerid][pSkillShotgunSawnoff],playerVariable[playerid][pSkillShotgunSpas12],
	playerVariable[playerid][pSkillUZI],playerVariable[playerid][pSkillMP5],playerVariable[playerid][pSkillAK47],
	playerVariable[playerid][pSkillM4A1],playerVariable[playerid][pSkillSniper]);
	SPD(params[0],38,DSM,title,string,"Закрыть","");
	
	format(string,sizeof(string),"%s[%i] показал(а) %s[%i] свои навыки владения оружием",
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gps(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	
	DialogGPS(playerid,0);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:pay(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"ui",params[0],params[1])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /pay [ID] [сумма]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(playerid==params[0]) return SCM(playerid,WHITE,CantUseOnSelf);
	if(!(0<params[1]<=playerVariable[playerid][pCash])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет столько денег!");
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	
	format(string,sizeof(string),"%s передал(а) %i$ %s",playerVariable[playerid][pName],params[1],playerVariable[params[0]][pName]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	
	playerVariable[playerid][pCash]-=params[1];
	playerVariable[params[0]][pCash]+=params[1];
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:phone(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	SPD(playerid,80,DSL,"Телефон","1. Статус телефона:\t\t\n2. Посмотреть баланс\n3. Позвонить\n4. Написать сообщение \
 	\n5. Отправить объявление в СМИ\n6. Черный список\n7. \n\n\n","Далее","Закрыть");
 	
 	format(string,sizeof(string),"%s достал(а) мобильный телефон",playerVariable[playerid][pName]);
 	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
 	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:dir(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	
	DialogDir(playerid,0);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:animlist(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);

	SPD(playerid,61,DSL,"Анимации","wdqefr","Выбрать","Закрыть");
	return 1;
}
ALTX:animlist("/anims","/animations");

////////////////////////////////////////////////////////////////////////////////

CMD:anim(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(sscanf(params,"i",params[0])) { format(string,sizeof(string),"%s Используйте: /anim [1 - x]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(!(1<=params[0]<=11)) { format(string,sizeof(string),"%s Номер анимации должен быть от 1 до x",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	//ApplyAnimation(playerid,"");
	return 1;
}
ALTX:anim("/animation");

////////////////////////////////////////////////////////////////////////////////

CMD:radio(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	
	DialogRadio(playerid,0);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:givegun(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	// proverka guns { format(string,sizeof(string),"%s У Вас нет этого оружия",PrefixPlayerError); return SCM(playerid,WHITE,string); }
 	if(sscanf(params,"ui",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /givegun [ID] [кол-во патрон]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
 	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
 	if(playerVariable[params[1]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
 	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
 	//if() return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет столько патрон!");
 	
	// obmen
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:healme(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pHeal]>=100) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы здоровы!");
	//if(itemVariable[playerid][iAidKid]<=0) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У Вас нет аптечки!");
	format(string,sizeof(string),"%s использовал(а) аптечку",playerVariable[playerid][pName]);
 	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
 	//itemVariable[playerid][iAirKid]-=1;
	//ApplyAnimation(playerid,);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:mask(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	//if(playerVariable[playerid][])
	
	format(string,sizeof(string),"%s надел(а) маску",playerVariable[playerid][pName]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	//ApplyAnimation(playerid,);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unmask(playerid) {
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:report(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(strlen(reportMessages[playerid])>0) { format(string,sizeof(string),"%s На Вашу жалобу еще не ответили!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(reportTimers[playerid]>0) { format(string,sizeof(string),"%s Писать в репорт можно раз в 30 секунд!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	SPD(playerid,63,DSM,"Репорт","Вы можете написать свой репорт администрации","Далее","Закрыть");
	return 1;
}
ALTX:report("/rep");

////////////////////////////////////////////////////////////////////////////////

CMD:leaders(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	
	SCM(playerid,WHITE,"Лидеры организаций в сети:");
	foreach(new i:Player) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pOrgRank]!=10) continue;
		format(string,sizeof(string),"%s[%i] - %s",playerVariable[i][pName],i,orgNames[playerVariable[i][pOrgID]][1]);
		SCM(playerid,WHITE,string);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:v(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:cancelrent(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(GetPVarInt(playerid,"RentCar") == 0) { format(string,sizeof(string),"%s У Вас нет арендованного транспорта!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	SetPVarInt(playerid,"RentCar",0);
	
	format(string,sizeof(string),"%s %s",PrefixHint,UnrentCar);
	SCM(playerid,WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////


















////////////////////////////////////////////////////////////////////////////////

//			L			E			A			D			E			R

////////////////////////////////////////////////////////////////////////////////

CMD:lmenu(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
    if(playerVariable[playerid][pOrgRank]<10) return SCM(playerid,WHITE,NotAccess);
    
    DialogLmenu(playerid,0);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:invite(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
    if(playerVariable[playerid][pOrgRank]<9) return SCM(playerid,WHITE,NotAccess);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /invite [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(playerVariable[params[0]][pOrgID]!=0) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок уже состоит в организации!");
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок слишком далеко от Вас!");
	
	if(playerid==1) {
		SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок принял Ваше предложение!");
		format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] Вы вступили в организацию %s","");
		SCM(params[0],WHITE,string);
		format(string,sizeof(string),"[{65FF4D}R{FFFFFF}] %s[%i] пригласил %s[%i] в организацию",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	} else {
		SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок отказался от Вашего предложения!");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:uninvite(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
	if(playerVariable[playerid][pOrgRank]<9) return SCM(playerid,WHITE,NotAccess);
	if(sscanf(params,"us[64]",params[0],params[1])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /uninvite [ID] [причина]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(playerVariable[params[0]][pOrgID]!=playerVariable[playerid][pOrgID]) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок не состоит в вашей оргнизации!");
	if(playerVariable[params[0]][pOrgRank]>=playerVariable[playerid][pOrgRank]) return SCM(playerid,WHITE,CantUseOnThisPlayer);
	
	format(string,sizeof(string),"%s %s[%i] уволил %s[%i] из организации. Причина: %s.",orgRanks[playerVariable[playerid][pOrgID]][playerVariable[playerid][pOrgRank]],
	playerVariable[playerid][pName],playerVariable[playerid][pID],playerVariable[params[0]][pName],playerVariable[params[0]][pID],params[1]);
	SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	SCM(params[0],WHITE,"Вы были уволены из организации.");
	playerVariable[params[0]][pOrgID]=0;
	playerVariable[params[0]][pOrgRank]=0;
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:offuninvite(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fwarn(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unfwarn(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:giverank(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:giveskin(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
	if(playerVariable[playerid][pOrgRank]<8) return SCM(playerid,WHITE,NotAccess);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /giveskin [ID]"); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[playerid][pOrgID]!=playerVariable[params[0]][pOrgID]) { format(string,sizeof(string),"%s Этот игрок не состоит в Вашей организации!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(playerVariable[params[0]][pOrgWorking]==false) { format(string,sizeof(string),"%s Игрок не на службе!",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	SPD(playerid,261,DSL,"Выбор формы","","Выбрать","Закрыть");
	format(string,sizeof(string),"Вы выдали новою форму %s[%i]",playerVariable[params[0]][pName],params[0]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s[%i] выдал(а) Вам новую форму.",playerVariable[playerid][pName],playerid);
	SCM(params[0],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:showblacklist(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:blacklist(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unblacklist(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gov(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
    if(playerVariable[playerid][pOrgRank]!=10) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"s[128]",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /gov [текст]");
	format(string,sizeof(string),"[Гос.новости] %s[%i]: %s",playerVariable[playerid][pName],playerid,params[0]);
	SCMtA(BLUE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////













































////////////////////////////////////////////////////////////////////////////////

//D   	E   	P   	A   	R   	T   	A   	M   	E   	N      T

////////////////////////////////////////////////////////////////////////////////

CMD:r(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
    if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"s[80]",params[0])) { format(string,sizeof(string),"%s Используйте: /r [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s %s %s[%i]: %s",PrefixR,adminVariable[playerid][aNameRank],playerVariable[playerid][pName],playerid,params[0]);
	SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:rn(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
	if(sscanf(params,"s[80]",params[0])) { format(string,sizeof(string),"%s Используйте: /rn [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);

	format(string,sizeof(string),"%s (( %s %s[%i]: %s ))",PrefixR,adminVariable[playerid][aNameRank],playerVariable[playerid][pName],playerid,params[0]);
	SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	return 1;
}
ALTX:rn("/rb");

////////////////////////////////////////////////////////////////////////////////

CMD:d(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
    if(playerVariable[playerid][pOrgRank]<5) return SCM(playerid,WHITE,NotAccess);
	if(sscanf(params,"s[80]",params[0])) { format(string,sizeof(string),"%s Используйте: /d [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);

	format(string,sizeof(string),"%s %s %s[%i]: %s",PrefixD,adminVariable[playerid][aNameRank],playerVariable[playerid][pName],playerid,params[0]);
	SendDepartamentChat(WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:udost(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /udost [ID]"); return SCM(playerid,WHITE,string); }

	//format(string,sizeof(string),"Удостоверение","Ник: %s\nОрганизация: %s\nДолжность: %s",playerVariable[playerid][pName],
	//organizationVariable[playerVariable[playerid][pOrgID]][oName],organizationVariable[playerVariable[playerid][pOrgRank]][]]);
	SPD(playerid,0,DSM,"Удостоверение",string,"Закрыть","");
	
	format(string,sizeof(string),"%s показал(а) удостоверение %s",playerVariable[playerid][pName],playerVariable[params[0]][pName]);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:go(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]==2 || playerVariable[playerid][pOrgID]==3)
	{

	}
	else if(playerVariable[playerid][pOrgID]==5)
	{

	}
	else return SCM(playerid,WHITE,NotInOrg);
	
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:load(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:members(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]==0) return SCM(playerid,WHITE,NotInOrg);
	
	new list[4096] = "Участник\tРанг\tВыговоры\n";
	foreach(new i:Player) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[playerid][pOrgID]!=playerVariable[i][pOrgID]) continue;

		format(list,sizeof(list),"%s%s[%i]\t%i\t%i\n",list,playerVariable[i][pName],playerVariable[i][pID],
		playerVariable[i][pOrgRank],playerVariable[i][pOrgReprimands]);
	}
	SPD(playerid,260,DSTH,"Сотрудники в сети",list,"Закрыть","");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////













////////////////////////////////////////////////////////////////////////////////

//     G       O       V       E       R       M       E       N		T

////////////////////////////////////////////////////////////////////////////////

CMD:gmenu(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:freedom(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=1) return SCM(playerid,WHITE,NotInGovern);
	if(playerVariable[playerid][pOrgRank]<7) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /freedom [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[playerid][pPrisonTime]<1) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока нет срока в тюрьме!");

	playerVariable[params[0]][pPrisonTime]=0;
	format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] %s %s[%i] выпустил Вас из тюрьмы!",orgRanks[playerVariable[playerid][pOrgID]][playerVariable[playerid][pOrgRank]],
	playerVariable[playerid][pName],playerVariable[playerid][pID]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] %s %s[%i] выпустил из тюрьмы игрока %s[%i].",orgRanks[playerVariable[playerid][pOrgID]][playerVariable[playerid][pOrgRank]],
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:listdebtors(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:evict(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fine(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

//					F				B				I

////////////////////////////////////////////////////////////////////////////////

CMD:givepass(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=2) return SCM(playerid,WHITE,NotInFBI);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /givepass [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"FBIkey")==0)
	{
		SetPVarInt(params[0],"FBIkey",1);
		format(string,sizeof(string),"%s[%i] выдал пропуск %s[%i]",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У этого игрока уже есть пропуск!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:takepass(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=2) return SCM(playerid,WHITE,NotInFBI);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /takepass [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"FBIkey")==1) {
		SetPVarInt(params[0],"FBIkey",0);
		format(string,sizeof(string),"%s забрал пропуск у %s",playerVariable[playerid][pName],playerVariable[params[0]][pName]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока отсутствует пропуск!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:wiretap(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=2) return SCM(playerid,WHITE,NotInFBI);
	if(playerVariable[playerid][pOrgRank]<2) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	SPD(playerid,120,DSL,"Прослушка","1. Правительсто\n2. Полицейский департамент\n3. Национальная гвардия\n4. Центральная больница \
	\n5. Радиоцентр\n6. Автошкола\n7. \n8. Выключить","Выбарть","Закрыть");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

//          	P       O       L       I       C       E

////////////////////////////////////////////////////////////////////////////////

CMD:ticket(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(playerVariable[playerid][pOrgID]==2 || playerVariable[playerid][pOrgID]==3)) return SCM(playerid,WHITE,NotInPolice);
	if(playerVariable[playerid][pOrgRank]<2) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"uis[64]",params[0],params[1],params[2])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /ticket [ID] [штраф] [причина]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	
	format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] Вы успешно выписали штраф игроку %s[%i] в размере %i. Причина: %s",
	playerVariable[params[0]][pName],playerVariable[params[0]][pID],params[1],params[2]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] Офицер %s[%i] выписал Вам штраф в размере %s. Причина: %s",
	playerVariable[playerid][pName],playerVariable[playerid][pID],params[1],params[2]);
	SCM(params[0],WHITE,string);
	playerVariable[params[0]][pFine]+=params[1];
	SaveVariableInteger("account","Fine",playerVariable[params[0]][pFine],playerVariable[playerid][pID]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:su(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(playerVariable[playerid][pOrgID]==2 || playerVariable[playerid][pOrgID]==3)) return SCM(playerid,WHITE,NotInPolice);
	if(playerVariable[playerid][pOrgRank]<5) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"uis[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /su [ID] [уровень розыска] [причина]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	format(string,sizeof(string),"%s Офицер %s[%i] выдал %s[%i] уровень розыска: %i. Причина: %s",PrefixInfo,playerVariable[playerid][pName],playerid,
	playerVariable[params[0]][pName],params[0],params[1],params[2]);
	SendOrgChat(2,WHITE,string);
	SendOrgChat(3,WHITE,string);
	format(string,sizeof(string),"%s Офицер %s[%i] выдал Вам уровень розыска: %i. Причина: %s",PrefixInfo,playerVariable[playerid][pName],playerid,
	params[1],params[2]);
	SCM(params[0],WHITE,string);
	SetPlayerWantedLevel(params[0],params[1]);

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:cuff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:uncuff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

//                      A       R       M       Y

////////////////////////////////////////////////////////////////////////////////










////////////////////////////////////////////////////////////////////////////////

//			H       O       S       P       I       T       A       L

////////////////////////////////////////////////////////////////////////////////

CMD:heal(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=5) return SCM(playerid,WHITE,NotInHospital);
	if(playerVariable[playerid][pOrgRank]<2) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	// if(itemVariable[playerid][iPill]<=0) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У Вас недостаточно медикаментов!"); - проверка на таблеки
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /heal [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[params[0]][pHeal]>=100.0) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок здоров!");
	
	format(string,sizeof(string),"%s Вы предложили %s[%i] пройти курс лечения за %i$",PrefixHint,playerVariable[params[0]][pName],params[0],PRICE_HEAL);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s %s[%i] предложил Вам пройти курс лечения за %i$",PrefixHint,playerVariable[playerid][pName],playerid,PRICE_HEAL);
	SCM(params[0],WHITE,string);
	SendOffer(params[0]);

	SetPVarInt(playerid,"healIDsender",params[0] + 1);
	SetPVarInt(params[0],"healIDgetter",playerid + 1);
	
	SCM(params[0],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:healdrug(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=5) return SCM(playerid,WHITE,NotInHospital);
	if(playerVariable[playerid][pOrgRank]<6) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /healdrug [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[playerid][pDrugAddiction]<1) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока нет зависимости!");
	// Y/N
	playerVariable[playerid][pCash]+=PRICE_CURE_DRUG_ADDICTION/2;
	playerVariable[params[0]][pDrugAddiction]-=10;
	playerVariable[params[0]][pCash]-=PRICE_CURE_DRUG_ADDICTION;
	SCM(params[0],WHITE,"[{8BFFF3}Подсказка{FFFFFF}] Вы успешно вылечились от наркозависимости!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:changesex(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=5) return SCM(playerid,WHITE,NotInHospital);
	if(playerVariable[playerid][pOrgRank]<7) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /changesex [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	// Y/N
	playerVariable[playerid][pCash]+=PRICE_CHANGESEX/2;
	if(playerVariable[params[0]][pSex]==false) playerVariable[params[0]][pSex]=true;
	else playerVariable[params[0]][pSex]=false;
	playerVariable[params[0]][pCash]-=PRICE_CHANGESEX;
	SCM(params[0],WHITE,"[{8BFFF3}Подсказка{FFFFFF}] Вы успешно сменили пол!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:givemedcard(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=5) return SCM(playerid,WHITE,NotInHospital);
	if(playerVariable[playerid][pOrgRank]<3) return SCM(playerid,WHITE,NotAccess);
 	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
 	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /givemedcard [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(playerVariable[playerid][pMedcard]>0) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока уже есть медицинская карточка!");
	
	playerVariable[playerid][pCash]+=PRICE_MEDCARD/2;
	playerVariable[params[0]][pMedcard]=7;
	playerVariable[params[0]][pCash]-=PRICE_MEDCARD;
	SCM(params[0],WHITE,"[{8BFFF3}Подсказка{FFFFFF}] Вы успешно получили медицинскую карточку на 7 дней!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////////////////////////

//					S               M               I

////////////////////////////////////////////////////////////////////////////////

CMD:edit(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=6) return SCM(playerid,WHITE,NotInNews);
	if(playerVariable[playerid][pOrgRank]<2) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	
	SPD(playerid,1111,DSTH,"Объявления","","Далее","Закрыть");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////






////////////////////////////////////////////////////////////////////////////////

//					D       R       I       V       E

////////////////////////////////////////////////////////////////////////////////

CMD:license(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pOrgID]!=7) return SCM(playerid,WHITE,NotInDriveSchool);
	if(playerVariable[playerid][pOrgRank]<3) return SCM(playerid,WHITE,NotAccess);
	if(playerVariable[playerid][pOrgWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /license [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////















////////////////////////////////////////////////////////////////////////////////

//		              M       A       F       I       A

////////////////////////////////////////////////////////////////////////////////

//bizlist — Бизнесы под контролем.
//debtors — Узнать список должников онлайн.
//tie — Связать в машине.
//untie — Освободить.
//mafiabank — Положить деньги на счет.
//mafiawithdraw — Снять деньги со счета.
//mafiabalance — Баланс счета.
//setdebt [id] — Предложить крышу.
//getdebt [id] — Выбить долг.
//debtor [id] — Узнать информацию об игроке.
//repaydebt [id] — Вернуть деньги.
//mydebts — Узнать информацию о себе.
//warehouse — Количество материалов на складе семьи.
//getgun — Взять оружие со склада.
//materials buy — Купить материалы в Аммунацию, на склад мафии.
//hackbase [id] — Снять розыск.

CMD:f(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	if(playerVariable[playerid][pMute]>0) return SCM(playerid,WHITE,InMute);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /f [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	format(string,sizeof(string),"%s %s[%i]: %s",PrefixF,playerVariable[playerid][pName],playerVariable[playerid][pID],params[0]);
	SendOrgChat(playerVariable[playerid][pOrgID],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:bizlist(playerid)
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	
	ClearQuery();
	new list[2048];
	mysql_tquery(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
		SPD(playerid,240,DSTH,"Бизнесы под контролем",list,"Выбрать","Закрыть");
	} else {
	    SendError(playerid,"/bizlist");
	    Debugging("ERROR : /bizlist : cache",playerid,0,0);
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:debtors(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:tie(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /tie [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerOffline);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"mafia_tie")==0)
	{
	    SetPVarInt(params[0],"mafia_tie",1);
	    TogglePlayerControllable(params[0],0);
	    format(string,sizeof(string),"%s[%i] связал %s[%i]",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок уже связан!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:untie(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /untie [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerOffline);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"mafia_tie")==1)
	{
	    SetPVarInt(params[0],"mafia_tie",0);
	    TogglePlayerControllable(params[0],1);
	    format(string,sizeof(string),"%s[%i] развязал %s[%i]",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок не связан!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gag(playerid,params[])
{
 	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
 	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
 	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /gag [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerOffline);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"mafia_gag")==0)
	{
		SetPVarInt(params[0],"mafia_gag",1);
		format(string,sizeof(string),"%s[%i] вставил кляп %s[%i]",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока есть кляп!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:ungag(playerid,params[])
{
 	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
 	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
 	if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /ungag [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerOffline);
	if(PlayerToPlayer(playerid,params[0])>DISTANCE_BETWEEN_PLAYERS) return SCM(playerid,WHITE,PlayerFarAway);
	if(GetPVarInt(params[0],"mafia_gag")==1)
	{
		SetPVarInt(params[0],"mafia_gag",0);
		format(string,sizeof(string),"%s[%i] вытащил кляп у %s[%i]",playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	}
	else SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] У игрока нет кляпа!");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:creategun(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	SPD(playerid,-1,DSL,"Выберите оружие","1.\n2.\n3.\n4.\n5.\n6.\n7.\n8.","Выбрать","Закрыть");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:sellgun(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:war(playerid,params[])
{

	GangZoneFlashForAll(zone1,0xFF0000FF);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:warehouse(playerid)
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(!(8<=playerVariable[playerid][pOrgID]<=12)) return SCM(playerid,WHITE,NotInMafia);
	if(playerVariable[playerid][pOrgRank]!=10) return SCM(playerid,WHITE,NotAccess);
	// check
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
























////////////////////////////////////////////////////////////////////////////////

//					J                   O                       B

////////////////////////////////////////////////////////////////////////////////

CMD:j(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]==0) return SCM(playerid,WHITE,NotInJob);
	if(playerVariable[playerid][pJobWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(sscanf(params,"s[80]",params[0])) { format(string,sizeof(string),"%s Используйте: /j [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s %s[%i]: %s",PrefixJ,playerVariable[playerid][pName],playerVariable[playerid][pID],string);
	SendJobChat(playerVariable[playerid][pJobID],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:jhelp(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]==0) return SCM(playerid,WHITE,NotInJob);
	
	switch(playerVariable[playerid][pJobID]) {
		case 1: SPD(playerid,380,DSM,"Информация о работе","Автобусник","Закрыть","");
		case 2: SPD(playerid,380,DSM,"Информация о работе","Такси","Закрыть","");
		case 3: SPD(playerid,380,DSM,"Информация о работе","Механик","Закрыть","");
		case 4: SPD(playerid,380,DSM,"Информация о работе","Мусорщик","Закрыть","");
		case 5: SPD(playerid,380,DSM,"Информация о работе","Курьер","Закрыть","");
		case 6: SPD(playerid,380,DSM,"Информация о работе","Продуктовоз","Закрыть","");
		case 7: SPD(playerid,380,DSM,"Информация о работе","Инкассатор","Закрыть","");
		case 8: SPD(playerid,380,DSM,"Информация о работе","Адвокат","Закрыть","");
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:jlock(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:junrent(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

// T A X I

////////////////////////////////////////////////////////////////////////////////

CMD:gotaxi(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]!=2) { format(string,sizeof(string),NotInJobTaxi); return SCM(playerid,WHITE,string); }
	if(playerVariable[playerid][pJobWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(GetPlayerState(playerid)!=2) { format(string,sizeof(string),"%s Вы не в рабочем транспорте!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /gotaxi [ID]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	//if player vizval taxi i ego vizov ewe ne prinyali return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок не вызывал такси либо его вызов уже приняли!");
	//stavitsya metka na igroka
	new Float:distance = PlayerToPlayer(playerid,params[0]);
	
	format(string,sizeof(string),"%s Вы приняли вызов игрока %s[%i]. Он находится в районе %s. Расстояние: %f.",
	PrefixJob,playerVariable[params[0]][pName],playerVariable[playerid][pID],GetPlayerDistrict(params[0]),distance);
	SCM(playerid,WHITE,string);
	
	format(string,sizeof(string),"%s Таксист %s[%i] принял вызов игрока %s[%i].",PrefixJob,
	playerVariable[playerid][pName],playerVariable[playerid][pID],playerVariable[params[0]][pName],playerVariable[params[0]][pID]);
	SendJobChat(playerVariable[playerid][pJobID],WHITE,string);
	
	format(string,sizeof(string),"%s Таксист %s[%i] принял Ваш вызов. Он находится в районе %s. Расстояние: %f.",PrefixHint,
	playerVariable[playerid][pName],playerVariable[playerid][pID],GetPlayerDistrict(playerid),distance);
	SCM(params[0],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:acceptcall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]==2) {
		if(playerVariable[playerid][pJobWorking]==false) return SCM(playerid,WHITE,NotWorking);
		//if(playerVariable[playerid][p]) esli ne v transporte return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не в рабочем транспорте!");
		if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /gotaxi [ID]");
		if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
		if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
		//if player vizval taxi i ego vizov ewe ne prinyali return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Игрок не вызывал такси либо его вызов уже приняли!");
		//stavitsya metka na igroka
		format(string,sizeof(string),"[{F4DE6F}Такси{FFFFFF}] Вы приняли вызов игрока %s[%i]. Он находится в районе %s.",
		playerVariable[params[0]][pName],playerVariable[playerid][pID],GetPlayerDistrict(params[0]));
		SCM(playerid,WHITE,string);
		format(string,sizeof(string),"[{F4DE6F}Такси{FFFFFF}] Таксист %s[%i] принял вызов игрока %s[%i].",
		playerVariable[playerid][pName],playerVariable[playerid][pID],playerVariable[params[0]][pName],playerVariable[params[0]][pID]);
		SendJobChat(playerVariable[playerid][pJobID],WHITE,string);
		format(string,sizeof(string),"[{8BFFF3}Подсказка{FFFFFF}] Таксист %s[%i] принял Ваш вызов. Он находится в районе %s.",
		playerVariable[playerid][pName],playerVariable[playerid][pID],GetPlayerDistrict(playerid));
		SCM(params[0],WHITE,string);
	} else if(playerVariable[playerid][pJobID]==3) {
	
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:cancelcall(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

// M E C H A N I C

////////////////////////////////////////////////////////////////////////////////

CMD:repaircar(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]!=3) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете механиком!");
	if(playerVariable[playerid][pJobWorking]==false) SCM(playerid,WHITE,NotWorking);
	//if(playerVariable[playerid][p]) esli ne v transporte return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не в рабочем транспорте!");
	if(sscanf(params,"ui",params[0],params[1])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /repair [ID] [цена за ремонт]");
	if(!(500<params[1]<=5000)) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Цена за ремонт должна быть от 500 до 5000$!");
	// remont auto
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fuelcar(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]!=3) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете механиком!");
	if(playerVariable[playerid][pJobWorking]==false) SCM(playerid,WHITE,NotWorking);
	//if(playerVariable[playerid][p]) esli ne v transporte return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не в рабочем транспорте!");
	if(sscanf(params,"uii",params[0],params[1],params[2])) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Используйте: /fuel [ID] [кол-во литров] [цена за литр]");
	if(!(0<params[1]<=100)) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Количество литров должно быть от 1 до 100!");
	if(!(500<params[2]<=5000)) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Цена за литр должна быть от 50 до 2000$!");
	// fuel auto
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

// T R A S H E R

////////////////////////////////////////////////////////////////////////////////

CMD:loadtrash(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]!=3) { format(string,sizeof(string),"%s Вы не работаете водителем мусоровоза!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	if(playerVariable[playerid][pJobWorking]==false) return SCM(playerid,WHITE,NotWorking);
	if(GetPlayerState(playerid)!=2) { format(string,sizeof(string),"%s Вы не за рулем грузовика!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	new nearestID = FindNearestTrashcan(playerid);
	new Float:nearestDist = PlayerToPoint(playerid,trashcanVariable[nearestID][tX],trashcanVariable[nearestID][tY],trashcanVariable[nearestID][tZ]);
	printf("%i %f",nearestID,nearestDist);
	if(nearestDist>10.0) { format(string,sizeof(string),"%s Рядом с Вами нет мусорки!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	new mass = CalculateFullnessTrashcan(nearestID);
	new carID = GetPVarInt(playerid,"RentCar");
	ClearTrashcan(nearestID);
	vehTrashmaster[carID][tFullness] += mass / 10;
	format(string,sizeof(string),TrashcanText,0);
	Update3DTextLabelText(trashcanVariable[nearestID][t3D],WHITE,string);
	format(string,sizeof(string),TrashmasterText,vehTrashmaster[carID][tFullness]);
	Update3DTextLabelText(vehTrashmaster[carID][t3D],WHITE,string);
	
	format(string,sizeof(string),"%s Вы собрали с мусорки %i кг.",PrefixJob,mass);
	SCM(playerid,WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unloadtrash(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pJobID]!=3) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не работаете мусорщиком!");
	if(playerVariable[playerid][pJobWorking]==false) SCM(playerid,WHITE,NotWorking);
	//if(playerVariable[playerid][p]) esli ne v transporte return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы не в рабочем транспорте!");
	//esli v oblasti kruga to razgruzka mysora + zp v payday
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

























////////////////////////////////////////////////////////////////////////////////

//				H				O				M				E

////////////////////////////////////////////////////////////////////////////////

CMD:hmenu(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////















////////////////////////////////////////////////////////////////////////////////

//			F			A			M			I			L			Y

////////////////////////////////////////////////////////////////////////////////

CMD:fam(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pFamID]==0) return SCM(playerid,WHITE,NotInFam);
	if(playerVariable[playerid][pMute]!=0) return SCM(playerid,WHITE,InMute);
	if(sscanf(params,"s[128]",params[0])) { format(string,sizeof(string),"%s Используйте: /fam [текст]",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	format(string,sizeof(string),"%s %s %s[%i]: %s",playerVariable[playerid][pName],playerid);
	SendFamChat(playerVariable[playerid][pFamID],WHITE,string);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fmenu(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pFamID]==0) return SCM(playerid,WHITE,NotInFam);
	if(playerVariable[playerid][pFamRank]<=3) return SCM(playerid,WHITE,NotAccess);
	
 	DialogFamilyMenu(playerid,0);
 	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fmembers(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:finvite(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:funinvite(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////























////////////////////////////////////////////////////////////////////////////////

// 			B		U		I		S		N		E		S		S

////////////////////////////////////////////////////////////////////////////////

CMD:bmenu(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:buybiz(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:sellbiz(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
























////////////////////////////////////////////////////////////////////////////////

//				C						A						R

////////////////////////////////////////////////////////////////////////////////

CMD:cmenu(playerid)
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER) { format(string,sizeof(string),"%s Вы не на месте водителя!",PrefixPlayerError); return SCM(playerid,WHITE,string); }
	
	new carID = GetPlayerVehicleID(playerid);
	DialogCmenu(playerid,0,carID);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fuel(playerid)
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(GetPlayerState(playerid)!=PLAYER_STATE_ONFOOT) return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Вы должны находиться около транспорта!");
	//if() return SCM(playerid,WHITE,"[{EF2E2E}Ошибка{FFFFFF}] Рядом с Вами нет транспорта!");
	format(string,sizeof(string),"%s[%i] заправил транспорт",playerVariable[playerid][pName],playerid);
	ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
	//itemVariable[playerid][iCanister]-=1;
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fixcar(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
















////////////////////////////////////////////////////////////////////////////////

//					A		D		M		I		N

////////////////////////////////////////////////////////////////////////////////

CMD:alogin(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==true) { format(string,sizeof(string),"%s Вы уже авторизованы!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    SPD(playerid,5001,DSP,"Вход","Введите админ-пароль:","Далее","Закрыть");
    
    LoggingAdminAction(playerid,"","/alogin",-1);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:aexit(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) { format(string,sizeof(string),"%s Вы еще не авторизованы!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	adminVariable[playerid][aLogged] = false;
	adminVariable[playerid][aWrongPassword] = 0;
	
	format(string,sizeof(string),"%s Администратор %s[%i] вышел из админ-системы!",PrefixAdmYellow,playerVariable[playerid][pName],playerid);
	SendAdminChat(playerid,WHITE,string);
	format(string,sizeof(string),"%s Вы успешно вышли из админ-системы!",PrefixAdmLime);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/aexit",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:ahelp(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	
	DialogAhelp(playerid,0);
	
	LoggingAdminAction(playerid,"","/ahelp",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:apanel(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);

	DialogApanel(playerid,0);
	
	LoggingAdminAction(playerid,"","/apanel",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:a(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"s[80]",params[0])) { format(string,sizeof(string),"%s Используйте: /a [текст]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	format(string,sizeof(string),"[{65FF4D}A{FFFFFF}] %s %s[%i]: %s",adminVariable[playerid][aNameRank],playerVariable[playerid][pName],playerid,params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/a",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:az(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
 	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
 	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
 	
 	Teleport(playerid,1727.28,-1642.94,20.22,180.0,18,1);
 	
 	format(string,sizeof(string),"%s Вы телепортировались в админ-зону",PrefixAdmYellow);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/az",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:re(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /re [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(playerid==params[0]) { format(string,sizeof(string),"%s Следить за собой нельзя!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(GetPVarInt(playerid,"adm_re")!=0) { format(string,sizeof(string),"%s Вы уже следите!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    
    new Float:X,Float:Y,Float:Z,Float:A;
    GetPlayerPos(playerid,X,Y,Z);
    GetPlayerFacingAngle(playerid,A);
    SetPVarFloat(playerid,"pos_X",X);
    SetPVarFloat(playerid,"pos_Y",Y);
    SetPVarFloat(playerid,"pos_Z",Z);
    SetPVarFloat(playerid,"pos_A",A);
    SetPVarInt(playerid,"re_int",GetPlayerInterior(params[0]));
    SetPVarInt(playerid,"re_virt",GetPlayerVirtualWorld(params[0]));
    
    TogglePlayerSpectating(playerid,true);
    SetPlayerInterior(playerid,GetPlayerInterior(params[0]));
    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(params[0]));
    if(IsPlayerInAnyVehicle(playerid)) PlayerSpectateVehicle(playerid,GetPlayerVehicleID(params[0]),1);
    else PlayerSpectatePlayer(playerid,params[0],1);
    SetPVarInt(playerid,"adm_re",1);
    adminVariable[playerid][aSpectating] = true;
    
    format(string,sizeof(string),"%s %s[%i] начал следить за игроком %s[%i]",PrefixAdmYellow,playerVariable[playerid][pName],playerid,
	playerVariable[params[0]][pName],params[0]);
    SendAdminChat(playerid,WHITE,string,false);
    
    LoggingAdminAction(playerid,string,"/re",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:reoff(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(GetPVarInt(playerid,"adm_re")==0) { format(string,sizeof(string),"%s Вы не следите!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
    TogglePlayerSpectating(playerid,false);
    SetPlayerPos(playerid,GetPVarFloat(playerid,"pos_X"),GetPVarFloat(playerid,"pos_Y"),GetPVarFloat(playerid,"pos_Z"));
    SetPlayerFacingAngle(playerid,GetPVarFloat(playerid,"pos_A"));
    SetPlayerInterior(playerid,GetPVarInt(playerid,"re_int"));
    SetPlayerVirtualWorld(playerid,GetPVarInt(playerid,"re_virt"));
    
    DeletePVar(playerid,"pos_X");
    DeletePVar(playerid,"pos_Y");
    DeletePVar(playerid,"pos_Z");
    DeletePVar(playerid,"pos_A");
	DeletePVar(playerid,"re_int");
    DeletePVar(playerid,"re_virt");
    
	SetPVarInt(playerid,"adm_re",0);
    adminVariable[playerid][aSpectating] = false;
    
    LoggingAdminAction(playerid,"","/reoff",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:say(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"us[144]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /say [ID] [текст]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(params[1]==EOS) { format(string,sizeof(string),"%s Нельзя отправить пустое сообщение!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	format(string,sizeof(string),"%s Вы сказали игроку %s[%i]: %s",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	format(string,200,"\n\nАдминистратор %s: %s\n\n",playerVariable[playerid][pName],params[1]);
	SPD(params[0],505,DSM,"Вам сказал администратор",string,"Закрыть","");
	format(string,WHITE,"%s Администратор %s[%i] сказал игроку %s[%i]: %s",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/say",params[0],0,params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:pm(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"us[144]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /pm [ID] [текст]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(params[1]==EOS) { format(string,sizeof(string),"%s Нельзя отправить пустое сообщение!"PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	format(string,200,"%s Вы ответили игроку %s[%i]: %s",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	format(string,200,"Администратор %s ответил Вам: %s",playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,WHITE,"%s Администратор %s[%i] ответил игроку %s[%i]: %s",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,params[0]);
	
	LoggingAdminAction(playerid,string,"/pm",params[0],0,params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:tp(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	
	SPD(playerid,506,DSL,"Телепорт","\n\n\n\n\n\n\n\n","Выбрать","Закрыть");
	
	LoggingAdminAction(playerid,"","/tp",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:jetpack(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	
	switch(GetPlayerSpecialAction(playerid)) {
		case SPECIAL_ACTION_NONE: {
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
			format(string,sizeof(string),"%s Джетпак включен!",PrefixAdmLime);
    		SCM(playerid,WHITE,string);
		}
		case SPECIAL_ACTION_USEJETPACK: {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		    format(string,sizeof(string),"%s Джетпак выключен!",PrefixAdmLime);
			SCM(playerid,WHITE,string);
		}
	}
	LoggingAdminAction(playerid,"","/jetpack",-1);
	return 1;
}
ALTX:jetpack("/jt","/jp","/jet");

////////////////////////////////////////////////////////////////////////////////

CMD:setpos(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
 	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    new Float:X,Float:Y,Float:Z;
	if(sscanf(params,"fff",X,Y,Z)) { format(string,sizeof(string),"%s Используйте: /setpos [X] [Y] [Z]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	SetPlayerPos(playerid,X,Y,Z);
	
	SCM(playerid,WHITE,AdmAccessTeleport);
	
	LoggingAdminAction(playerid,"","/setpos",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getpos(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
 	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getpos [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	
	new Float:posX,Float:posY,Float:posZ;
	GetPlayerPos(params[0],posX,posY,posZ);
	
	format(string,sizeof(string),"%s Координаты игрока %s[%i]: %f %f %f",PrefixAdmLime,playerVariable[params[0]][pName],params[0],posX,posY,posZ);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/getpos",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:admins(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	SCM(playerid,WHITE,"[{FFF050}ADM{FFFFFF}] Администраторы в сети:");
    foreach(new i:Player) {
		if(playerVariable[i][pAdmin]==0) continue;
		if(adminVariable[i][aLogged]==true) {
			format(string,sizeof(string),"%s[%i] | %s | {00FF00}Авторизован{FFFFFF} в систему администрирования",playerVariable[i][pName],i,adminVariable[i][aLVL]);
			SCM(playerid,WHITE,string);
		} else {
			format(string,sizeof(string),"%s[%i] | %s | {FF0000}Не авторизован{FFFFFF} в систему администрирования",playerVariable[i][pName],i,adminVariable[i][aLVL]);
			SCM(playerid,WHITE,string);
		}
	}
	LoggingAdminAction(playerid,"","/admins",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getstats(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0],params[1])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /getstats [ID]");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	format(string,sizeof(string),"Ник: %s\nУровень: %i\nПол: %s\nРайон: %s",playerVariable[params[0]][pName],
	playerVariable[params[0]][pLVL],playerVariable[params[0]][pSex],cityDistricts[GetPlayerDistrict(playerid)][distName]);
	SPD(playerid,501,DSM,"Статистика",string,"Закрыть","");
	
	LoggingAdminAction(playerid,"","/getstats",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:aveh(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    //if(GetPVarInt(playerid,!"adm_veh")) return SCM(playerid,WHITE,!"[{FF2424}ADM{FFFFFF}] Удалите предыдущий трансопорт!");
	if(sscanf(params,"iii",params[0],params[1],params[2])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /aveh [ID] [цвет 1] [цвет 2]");
	if(params[0]<400 || params[0]>611) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] ID транспорта должен быть от 400 до 611");
	if(params[1]<0 || params[1]>255) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] ID первого цвета транспорта должен быть от 0 до 255");
	if(params[2]<0 || params[2]>255) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] ID второго цвета транспорта должен быть от 0 до 255");
	if(IsForbiddenVehicle(params[0]) && playerVariable[playerid][pAdmin] < 6) { format(string,sizeof(string),"%s Этот транспорт запрещен на сервере!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	new	Float:X,Float:Y,Float:Z,Float:Angle;
    GetPlayerPos(playerid,X,Y,Z);
    GetPlayerFacingAngle(playerid,Angle);
    new carID = ASVex(params[0],X,Y,Z,Angle,params[1],params[2],-1);
    vehicleVariable[carID][vFuel]=FUEL_IN_CAR;
    SetPVarInt(playerid,!"adm_veh",carID);
    PutPlayerInVehicle(playerid,GetPVarInt(playerid,!"adm_veh"),0);
    
    format(string,sizeof(string),"%s Вы успешно создали транспорт!",PrefixAdmLime);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/veh",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:adelveh(playerid)
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(GetPVarInt(playerid,!"adm_veh")==0) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Вы не создавали транспорт!");
    
    ClearVehicle(GetPVarInt(playerid,"adm_veh"));
    DestroyVehicle(GetPVarInt(playerid,!"adm_veh"));
    //DeletePVar(playerid,!"adm_veh");
    
    SCM(playerid,WHITE,!"[{65FF4D}ADM{FFFFFF}] Транспорт был успешно удален!");
    
    LoggingAdminAction(playerid,"","/delveh",-1);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:plveh(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"uiii",params[0],params[1],params[2],params[3])) { format(string,sizeof(string),"%s Используйте: /plveh [ID игрока] [ID] [цвет 1] [цвет 2]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(400<=params[1]<=611)) { format(string,sizeof(string),"%s ID транспорта должен быть от 400 до 611!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[2]<=255)) { format(string,sizeof(string),"%s ID первого цвета должен быть от 0 до 255!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[3]<=255)) { format(string,sizeof(string),"%s ID второго цвета должен быть от 0 до 255!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(IsForbiddenVehicle(params[1]) && playerVariable[playerid][pAdmin] < 6)
	 	{ format(string,sizeof(string),"%s Этот транспорт запрещен на сервере!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	new Float:X,Float:Y,Float:Z,Float:Angle;
	GetPlayerPos(params[0],X,Y,Z);
	GetPlayerFacingAngle(params[0],Angle);
	
	format(string,sizeof(string),"%s Вы выдали временный транспорт игроку %s[%i] (ID: %i; Color1: %i; Color2: %i)",
	PrefixAdmLime,playerVariable[params[0]],params[0],params[1],params[2],params[3]);
	SCM(playerid,WHITE,string);
	
	format(string,sizeof(string),"%s Администратор %s выдал Вам временный транспорт",PrefixHint,playerVariable[playerid][pName]);
	SCM(params[0],WHITE,string);
	
	format(string,sizeof(string),"%s Администратор %s[%i] выдал временный транспорт игроку %s[%i] (ID: %i; Color1: %i; Color2: %i)",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]],params[0],params[1],params[2],params[3]);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/plveh",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:delplveh(playerid,params[])
{
    LoggingAdminAction(playerid,string,"/delplveh",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fixveh(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"i",params[0])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /fixveh [ID транспорта]");
    
	RepairVehicle(params[0]);
	
	SCM(playerid,WHITE,"[{65FF4D}ADM{FFFFFF}] Транспорт успешно отремонтирован!");
	
	LoggingAdminAction(playerid,"","/fixveh",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setfuel(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"ii",params[0],params[1])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /setfuel [ID транспорта] [кол-во]");
    if(!(0<=params[1])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Кол-во топлива должно быть от 0!");
    
    vehicleVariable[params[0]][vFuel] = params[1];
    
    format(string,sizeof(string),"[{65FF4D}ADM{FFFFFF}] Транспорт успешно заправлен до %i литров!",params[1]);
    SCM(playerid,WHITE,string);
    
    LoggingAdminAction(playerid,"","/setfuel",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setfuelall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"ii",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /setfuelall [радиус] [кол-во]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!(0<=params[0]<=FUEL_IN_CAR)) { format(string,sizeof(string),"%s Кол-во топлива должно быть от 0!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    
	forveh(i) vehicleVariable[i][vFuel]=params[0];
	
	format(string,sizeof(string),"%s Администратор %s[%i] установил кол-во топлива для всего транспорта: %i литров!",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,params[0]);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/setfuelall",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:spawn(playerid) {
	SetPlayerPos(playerid,-1106.7,419.8,500.0);
	LoggingAdminAction(playerid,"","/spawn",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:spplayer(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /spplayer [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	
	format(string,sizeof(string),"%s Администратор %s заспавнил Вас.",PrefixHint,playerVariable[playerid][pName]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] заспавнил игрока %s[%i].",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]],params[0]);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/spplayer",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:spcar(playerid,params[]) {
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gethp(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /gethp [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

	new Float:F;
	GetPlayerHealth(params[0],F);
	
	format(string,sizeof(string),"%s Уровень здоровья игрока %s[%i]: %f.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],F);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/gethp",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:sethp(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"ui",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /sethp [ID] [кол-во]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[1]<=100)) { format(string,sizeof(string),"%s Уровень здоровья должен быть от 0 до 100!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	SetPlayerHealth(params[0],params[1]);
	SaveVariableInteger("accounts","satiety",params[1],playerVariable[params[0]][pID]);
	
	format(string,100,"%s Администратор %s установил вам уровень здоровья: %i.",PrefixHint,playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,100,"%s Вы установили игроку %s[%i] уровень здоровья: %i.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] установил игроку %s[%i] уровень здоровья: %i.",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/sethp",params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:sethpall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"ii",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /sethpall [радиус] [кол-во]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[1]<=100)) { format(string,sizeof(string),"%s Уровень здоровья должен быть от 0 до 100!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	new count = 0,Float:radius,Float:X,Float:Y,Float:Z;
	radius = float(params[0]);
	GetPlayerPos(playerid,X,Y,Z);
	for(new i = 0; i < MAX_PLAYERS; ++i) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerid==i) continue;
		if(GetPlayerVirtualWorld(playerid)!=GetPlayerVirtualWorld(i)) continue;
		if(!IsPlayerInRangeOfPoint(i,radius,X,Y,Z)) continue;
		format(string,sizeof(string),"%s Администратор %s установил Вам уровень здоровья: %i.",PrefixHint,playerVariable[playerid][pName],params[1]);
		SCM(i,WHITE,string);
		++count;
	}
	format(string,sizeof(string),"%s Администратор %s установил уровень здоровья %i игрокам: %i.",PrefixAdmYellow,count,params[1]);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/sethpall",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getarmour(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getarmour [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

	new Float:F;
	GetPlayerArmour(params[0],F);

	format(string,sizeof(string),"%s Уровень бронижелета игрока %s[%i]: %f.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],F);
	SCM(playerid,WHITE,string);

	LoggingAdminAction(playerid,string,"/getarmour",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setarmour(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"ui",params[0],params[1])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /setarmour [ID] [кол-во]");
	if(!(0<=params[1]<=100)) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Уровень бронижелета должен быть от 0 до 100!");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	SetPlayerArmour(params[0],params[1]);
	SaveVariableInteger("accounts","armour",params[1],playerVariable[params[0]][pID]);
	
	format(string,100,"[{65FF4D}ADM{FFFFFF}] Вы установили игроку %s уровень бронижелета: %i.",playerVariable[params[0]][pName],params[1]);
	SCM(playerid,WHITE,string);
	format(string,100,"Администратор %s установил вам уровень бронижелета: %i.",playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"[{FFF050}ADM{FFFFFF}] Администратор %s[%i] установил игроку %s[%i] уровень бронижелета: %f",
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/setarmour",params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getsatiety(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getsatiety [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

	format(string,sizeof(string),"%s Уровень сытости игрока %s[%i]: %i.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],playerVariable[params[0]][pSatiety]);
	SCM(playerid,WHITE,string);

	LoggingAdminAction(playerid,string,"/getsatiety",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setsatiety(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"ui",params[0],params[1])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /setsatiety [ID] [кол-во]");
	if(!(0<=params[1]<=100)) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Уровень сытости должен быть от 0 до 100!");
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	playerVariable[params[0]][pSatiety] = params[1];
	SaveVariableInteger("accounts","satiety",params[1],playerVariable[params[0]][pID]);
	
	format(string,100,"[{65FF4D}ADM{FFFFFF}] Вы установили игроку %s уровень сытости: %i.",playerVariable[params[0]][pName],params[1]);
	SCM(playerid,WHITE,string);
	format(string,100,"Администратор %s установил вам уровень сытости: %i.",playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"[{FFF050}ADM{FFFFFF}] Администратор %s[%i] установил игроку %s[%i] уровень сытости: %i",
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
    LoggingAdminAction(playerid,string,"/setsatiety",params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getskin(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getskin [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

	format(string,sizeof(string),"%s ID скина игрока %s[%i]: %i.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],GetPlayerSkin(params[0]));
	SCM(playerid,WHITE,string);

	LoggingAdminAction(playerid,string,"/getskin",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setskin(playerid,params[0]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"ui",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /setskin [ID игрока] [ID скина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[1]<=311)) { format(string,sizeof(string),"%s ID скина должен быть от 0 до 311!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	SetPlayerSkin(params[0],params[1]);
	
	format(string,sizeof(string),"%s Вы установили игроку %s[%i] скин: %i.",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Администратор %s установил Вам скин: %i.",PrefixHint,playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] установил игроку %s[%i] скин: %i",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/setskin",params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setskinall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"ii",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /setskinall [радиус] [ID скина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!(0<=params[1]<=311)) { format(string,sizeof(string),"%s ID скина должен быть от 0 до 311!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	new count = 0,Float:radius,Float:X,Float:Y,Float:Z;
	radius = float(params[0]);
	GetPlayerPos(playerid,X,Y,Z);
	for(new i = 0; i < MAX_PLAYERS; ++i) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerid==i) continue;
		if(GetPlayerVirtualWorld(playerid)!=GetPlayerVirtualWorld(i)) continue;
		if(!IsPlayerInRangeOfPoint(i,radius,X,Y,Z)) continue;
		SetPlayerSkin(i,params[1]);
		format(string,sizeof(string),"%s Администратор %s выдал Вам временный скин: %i",PrefixHint,playerVariable[playerid][pName],params[1]);
		SCM(i,WHITE,string);
		++count;
	}
	format(string,sizeof(string),"%s Администратор %s[%i] установил %i игрокам временный скин: %i",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,count,params[1]);
	SendAdminChat(playerid,WHITE,string,false);

	LoggingAdminAction(playerid,string,"/setskinall",-1,params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getvw(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getvw [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	params[1] = GetPlayerVirtualWorld(params[0]);

	format(string,sizeof(string),"%s Виртульный мир игрока %s[%i]: %i",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/getvw",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:setvw(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(sscanf(params,"ui",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /setvw [ID игрока] [ID вирт. мира]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(!(0<=params[1]<=65536)) { format(string,sizeof(string),"%s Номер виртуального мира должен быть от 0 до 65536!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	SetPlayerVirtualWorld(params[0],params[1]);
	
	format(string,sizeof(string),"%s Вы установили игроку %s[%i] виртуальный мир: %i",PrefixAdmLime,playerVariable[params[0]][pName],params[0],params[1]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] установил Вам виртуальный мир: %i",PrefixHint,playerVariable[playerid][pName],playerid,params[1]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] установил игроку %s[%i] виртуальный мир: %i",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,"","/setvw",params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:freeze(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /freeze [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	if(GetPVarInt(playerid,"adm_freeze")==0) {
	    SetPVarInt(playerid,"adm_freeze",1);
	    TogglePlayerControllable(params[0],0);
	    format(string,sizeof(string),"%s Вы заморозили игрока %s",PrefixAdmLime,playerVariable[params[0]][pName]);
	    SCM(playerid,WHITE,string);
	    format(string,sizeof(string),"%s Администратор %s заморозил Вас.",PrefixHint,playerVariable[playerid][pName]);
	    SCM(params[0],WHITE,string);
	    format(string,sizeof(string),"%s Администратор %s[%i] заморозил игрока %s[%i].",
		PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		SendAdminChat(playerid,WHITE,string,false);
	} else {
		format(string,sizeof(string),"%s Игрок уже заморожен!",PrefixAdmRed);
	    SCM(playerid,WHITE,string);
	}
	
	LoggingAdminAction(playerid,string,"/freeze",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unfreeze(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /unfreeze [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	if(GetPVarInt(playerid,"adm_freeze")==0) {
	    format(string,sizeof(string),"%s Игрок не заморожен!",PrefixAdmRed);
	    SCM(playerid,WHITE,string);
	} else {
	    SetPVarInt(playerid,"adm_freeze",0);
	    TogglePlayerControllable(params[0],1);
 		format(string,sizeof(string),"%s Вы разморозили игрока %s",PrefixAdmLime,playerVariable[params[0]][pName]);
	    SCM(playerid,WHITE,string);
	    format(string,sizeof(string),"%s Администратор %s разморозил Вас.",PrefixHint,playerVariable[playerid][pName]);
	    SCM(params[0],WHITE,string);
	    format(string,sizeof(string),"%s Администратор %s[%i] разморозил игрока %s[%i].",
		PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
		SendAdminChat(playerid,WHITE,string,false);
	}
	
	LoggingAdminAction(playerid,string,"/unfreeze",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:freezeall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"i",params[0])) { format(string,sizeof(string),"%s Используйте: /freezeall [радиус]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	new count = 0,Float:radius,Float:X,Float:Y,Float:Z;
	radius = float(params[0]);
	GetPlayerPos(playerid,X,Y,Z);
	for(new i = 0; i < MAX_PLAYERS; ++i) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerid==i) continue;
		if(GetPlayerVirtualWorld(playerid)!=GetPlayerVirtualWorld(i)) continue;
		if(!IsPlayerInRangeOfPoint(i,radius,X,Y,Z)) continue;
		SetPVarInt(i,"adm_freeze",1);
		TogglePlayerControllable(i,0);
		format(string,sizeof(string),"%s Администратор %s заморозил Вас.",PrefixHint,playerVariable[playerid][pName]);
		SCM(i,WHITE,string);
		++count;
	}
	format(string,sizeof(string),"%s Администратор %s заморозил %i игроков.",PrefixAdmYellow,playerVariable[playerid][pName],count);
	SendAdminChat(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/freezeall",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unfreezeall(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"i",params[0])) { format(string,sizeof(string),"%s Используйте: /unfreezeall [радиус]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	new count = 0,Float:radius,Float:X,Float:Y,Float:Z;
	radius = float(params[0]);
	GetPlayerPos(playerid,X,Y,Z);
	for(new i = 0; i < MAX_PLAYERS; ++i) {
		if(!IsPlayerConnected(i)) continue;
		if(playerVariable[i][pLogged]==false) continue;
		if(playerid==i) continue;
		if(GetPlayerVirtualWorld(playerid)!=GetPlayerVirtualWorld(i)) continue;
		if(!IsPlayerInRangeOfPoint(i,radius,X,Y,Z)) continue;
		SetPVarInt(i,"adm_freeze",0);
		TogglePlayerControllable(i,1);
		format(string,sizeof(string),"%s Администратор %s разморозил Вас.",PrefixHint,playerVariable[playerid][pName]);
		SCM(i,WHITE,string);
		++count;
	}
	format(string,sizeof(string),"%s Администратор %s разморозил %i игроков.",PrefixAdmYellow,playerVariable[playerid][pName],count);
	SendAdminChat(playerid,WHITE,string);

	LoggingAdminAction(playerid,string,"/unfreezeall",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:slap(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Используйте: /slap [ID]");
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(params[0],X,Y,Z);
	SetPlayerPos(params[0],X,Y,Z+10);
	
    format(string,sizeof(string),"%s Администратор %s[%i] дал Вам пинка.",PrefixHint,playerVariable[playerid][pName],playerid);
    SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Вы дали пинка игроку %s[%i].",PrefixAdmLime,playerVariable[params[0]][pName],params[0]);
	SCM(playerid,WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] дал пинка игроку %s[%i].",PrefixAdmYellow,
	playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
    SendAdminChat(playerid,WHITE,string,false);

	LoggingAdminAction(playerid,string,"/slap",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:flip(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /flip [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	new carID = GetPlayerVehicleID(playerid);
	if(carID==0) { format(string,sizeof(string),"%s Игрок не в транспорте!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	new Float:pos_X,Float:pos_Y,Float:pos_Z,Float:pos_a;
	GetVehiclePos(carID,pos_X,pos_Y,pos_Z);
	GetVehicleZAngle(carID,pos_a);
	SetVehiclePos(carID,pos_X,pos_Y,pos_Z+1);
	SetVehicleZAngle(carID,pos_a);
 	RepairVehicle(carID);
 	SetVehicleParams(carID);
 	
	format(string,sizeof(string),"%s Вы подкинули транспорт игрока %s[%i].",PrefixAdmLime,playerVariable[params[0]][pName],params[0]);
	SCM(playerid,WHITE,string);
    format(string,sizeof(string),"Администратор %s[%i] подкинул Ваш транспорт.",playerVariable[playerid][pName],playerid);
    SCM(params[0],WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] подкинул транспорт игрока %s[%i].",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
    SendAdminChat(playerid,WHITE,string,false);
    
    LoggingAdminAction(playerid,string,"/flip",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:kick(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"us[32]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /kick [ID] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

    format(string,sizeof(string),"Администратор %s кикнул игрока %s. Причина: %s",playerVariable[params[0]][pName],playerVariable[playerid][pName],params[1]);
	SendToAllChatSettingAdminAction(WHITE,string);
	SPD(params[0],7,DSM,"Информация","Вы были кикнуты с сервера!","Закрыть","");
	SendAdvice(params[0]);
	Kick(params[0]);
	
	LoggingAdminAction(playerid,string,"/fixveh",params[0],1,params[1]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:skick(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"us[32]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /skick [ID] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

    format(string,sizeof(string),"Администратор %s кикнул Вас с сервера! Причина: %s",playerVariable[playerid][pName],params[1]);
    SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s тихо кикнул игрока %s с сервера. Причина: %s",
	PrefixAdmYellow,playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1]);
	SendAdminChat(playerid,WHITE,string);
    SPD(params[0],7,DSM,"Информация","Вы были кикнуты с сервера!","Закрыть","");
	SendAdvice(params[0]);
    Kick(params[0]);
    
    LoggingAdminAction(playerid,string,"/skick",params[0],1,params[1]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:mute(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"uis[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /mute [ID] [время] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(playerVariable[params[0]][pMute]!=0) return SCM(playerid,WHITE,AdmPlayerInMute);
	
    format(string,sizeof(string),"Администратор %s выдал Вам мут на %i минут! Причина: %s",playerVariable[playerid][pName],params[1],params[2]);
    SCM(params[0],WHITE,string);
    format(string,sizeof(string),"Администратор %s выдал мут игроку %s на %i минут. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1],params[2]);
    SendToAllChatSettingAdminAction(WHITE,string);
	SendAdvice(params[0]);
	SaveVariableInteger("account","Mute",params[1],playerVariable[params[0]][pID]);
	
	LoggingAdminAction(playerid,string,"/mute",params[0],params[1],params[2]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unmute(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"us[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /unmute [ID] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(playerVariable[params[0]][pMute]==0) { format(string,sizeof(string),"%s У игрока отсутствует мут!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    format(string,sizeof(string),"Администратор %s снял Вам мут! Причина: %s",playerVariable[playerid][pName],params[1]);
    SCM(params[0],WHITE,string);
	format(string,sizeof(string),"Администратор %s снял мут игроку %s. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1]);
    SCMtA(WHITE,string);
    
	SaveVariableInteger("account","Mute",0,playerVariable[params[0]][pID]);
	
	LoggingAdminAction(playerid,string,"/unmute",params[0],1,params[1]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:jail(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<3) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"uis[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /jail [ID] [время] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

	params[1] *= 60;
	playerVariable[playerid][pJail] = params[1];
	SaveVariableInteger("account","Jail",params[1],playerVariable[params[0]][pID]);
	
    format(string,sizeof(string),"Администратор %s посадил игрока %s в тюрьму на %i минут. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1],params[2]);
    SCMtA(WHITE,string);
    format(string,sizeof(string),"Администратор %s посадил Вас в тюрьму на %i минут. Причина: %s",playerVariable[playerid][pName],params[1],params[2]);
    SCM(params[0],WHITE,string);
    SendAdvice(params[0]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unjail(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<2) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"us[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /unjail [ID] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(playerVariable[params[0]][pMute]==0) { format(string,sizeof(string),"%s Игрок не находится в тюрьме!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    format(string,sizeof(string),"Администратор %s выпустил из тюрьмы игрока %s. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1]);
    SendToAllChatSettingAdminAction(WHITE,string);
    format(string,sizeof(string),"Администратор %s выпустил Вас из тюрьмы! Причина: %s",playerVariable[playerid][pName],params[1]);
    SCM(params[0],WHITE,string);
    
	SaveVariableInteger("account","Jail",0,playerVariable[params[0]][pID]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:jailoff(playerid,params[])
{
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<3) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"s[25]ds[33]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /jailoff [ник] [время] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(IsPlayerConnected(GetPlayerIDFromName(params[0]))) return SCM(playerid,WHITE,"%s Игрок в сети! Используйте /jail");
    if(params[0]<0) { format(string,sizeof(string),"%s Ошибка! Время должно быть больше 0!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    ClearQuery();
	format(string,sizeof(string),"SELECT `ID` FROM `account` WHERE `NickName` = '%s' LIMIT 1",params[0]);
	mysql_query(MySQL:DATABASE,string);
	if(cache_get_row_count(rows)) {
	    if(rows == 1) {
            ClearQuery();
			format(query,sizeof(query),"UPDATE `accounts` SET `Jail` = '%i' WHERE `NickName` = '%s'",params[1],params[0]);
			mysql_tquery(MySQL:DATABASE,query);
			
		    format(string,sizeof(string),"Администратор %s посадил игрока %s в тюрьму в оффлайне на %i минут. Причина: %s",playerVariable[playerid][pName],params[0],params[1],params[2]);
		    SendToAllChatSettingAdminAction(WHITE,string);
		} else {
            format(string,sizeof(string),"%s Ошибка! Аккаунта не существует!",PrefixAdmRed);
			return SCM(playerid,WHITE,string);
		}
	} else {

	}
	
	LoggingAdminAction(playerid,string,"/jailoff",params[0],params[1],params[2]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unjailoff(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<3) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"s[25]ds[33]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /unjailoff [ник] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(GetPlayerIDFromName(params[0]))) { format(string,sizeof(string),"%s Игрок в сети! Используйте /unjail!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	ClearQuery();
	format(query,sizeof(query),"SELECT `ID` FROM `account` WHERE `NickName` = '%s' LIMIT 1",params[0]);
	mysql_query(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
	    if(rows == 1) {
	        ClearQuery();
			format(query,sizeof(query),"UPDATE `account` SET `Jail` = '%i' WHERE `NickName` = '%s'",0,params[0]);
			mysql_tquery(MySQL:DATABASE,query);
			
		 	format(string,sizeof(string),"Администратор %s выпустил игрока %s из тюрьмы в оффлайне. Причина: %s",playerVariable[playerid][pName],params[0],params[1]);
		    SendToAllChatSettingAdminAction(WHITE,string);
	    } else {
            format(string,sizeof(string),"%s Ошибка! Аккаунта не существует!",PrefixAdmRed);
			return SCM(playerid,WHITE,string);
		}
	} else {

	}
	
	LoggingAdminAction(playerid,string,"/unjailoff",-1,params[0],params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:warn(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<4) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"us[32]",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /warn [ID] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(playerVariable[params[0]][pWarn]==2) {
	
	} else {
	    ClearQuery();
		format(query,sizeof(query),"UPDATE `player_punishes` SET `Warn` = `Warn` + 1 WHERE `ID` = '%i'",playerVariable[params[0]][pID]);
		playerVariable[params[0]][pWarn]++;
		
		format(string,sizeof(string),"Администратор %s[%i] выдал предупреждение игроку %s[%i]. Причина: %s. [%i/3]",
		playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1],playerVariable[params[0]][pWarn]);
		SendToAllChatSettingAdminAction(WHITE,string);
	}
	
	LoggingAdminAction(playerid,string,"/warn",params[0],0,params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unwarn(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:warnoff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unwarnoff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:ban(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<4) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"uis[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /ban [ID] [кол-во дней] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(params[1]>365 || params[1]<7) { format(string,sizeof(string),"%s Забанить можно только на 7-365 дней!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
    SaveVariableInteger("account","Ban",params[1],playerVariable[params[0]][pID]);
    
 	format(string,sizeof(string),"Администратор %s заблокировал игрока %s на %i дней. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1],params[2]);
    SendToAllChatSettingAdminAction(WHITE,string);
    SendAdvice(params[0]);
    Ban(params[0]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unban(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(adminVariable[playerid][aLVL]<5) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"s[25]s[32]"),params[0],params[1]) { format(string,sizeof(string),"%s Используйте: /unban [ник] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    ClearQuery();
	format(query,sizeof(query),"UPDATE `accounts` SET `Ban` = '0' WHERE `NickName` = '%s'",params[0]);
	
	if(cache_get_row_count(rows)) {
		format(string,sizeof(string),"Администратор %s разблокировал аккаунт %s. Причина: %s",playerVariable[playerid][pName],params[0],params[1]);
  		SendToAllChatSettingAdminAction(WHITE,string);
	} else {
		SendError(playerid,"/unban");
		Debugging("/unban : cache",playerid,0,0);
	}
	
	LoggingAdminAction(playerid,string,"/unban",params[0],0,params[1]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:sban(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:fakeban(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<4) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"uis[32]",params[0],params[1],params[2])) { format(string,sizeof(string),"%s Используйте: /fakeban [ID] [кол-во дней] [причина]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);

 	format(string,sizeof(string),"Администратор %s заблокировал игрока %s на %i дней. Причина: %s",playerVariable[playerid][pName],playerVariable[params[0]][pName],params[1],params[2]);
    SendToAllChatSettingAdminAction(WHITE,string);
	SendAdminChat(playerid,WHITE,"FAKEBAN");
	Kick(params[0]);

    LoggingAdminAction(playerid,string,"/fakeban",params[0],params[1],params[2]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:banoff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unbanoff(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:banip(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:unbanip(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:goto(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /goto [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
   	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	new Float:X,Float:Y,Float:Z;
    GetPlayerPos(params[0],X,Y,Z);
    SetPlayerPos(playerid,X+2,Y,Z);
    SetPlayerInterior(playerid,GetPlayerInterior(params[0]));
    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(params[0]));
    
    format(string,70,"Администратор %s телепортировался к Вам.",playerVariable[playerid][pName]);
    SCM(params[0],WHITE,string);
    format(string,70,"%s Вы телепортировались к игроку %s[%i].",PrefixAdmLime,playerVariable[params[0]][pName],params[0]);
    SCM(playerid,WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] телепортировался к игроку %s[%i].",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/goto",params[0]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gethere(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /gethere [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
   	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	
	new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid,X,Y,Z);
    SetPlayerPos(params[0],X-2,Y,Z);
    SetPlayerInterior(params[0],GetPlayerInterior(playerid));
    SetPlayerVirtualWorld(params[0],GetPlayerVirtualWorld(playerid));
    
    format(string,sizeof(string),"Администратор %s телепортировал Вас к себе.",playerVariable[playerid][pName]);
    SCM(params[0],WHITE,string);
    format(string,sizeof(string),"%s Вы телепортировали к себе %s[%i].",PrefixAdmLime,playerVariable[params[0]][pName],params[0]);
    SCM(playerid,WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] телепортировал к себе игрока %s[%i].",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/gethere",params[0]);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:gotocar(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(sscanf(params,"i",params[0])) { format(string,sizeof(string),"%s Используйте: /gotocar [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    
	new Float:X,Float:Y,Float:Z;
    GetVehiclePos(params[0],X,Y,Z);
    SetPlayerPos(playerid,X+2,Y,Z);
    
    format(string,sizeof(string),"%s Вы телепортировались к транспорту ID: %i.",PrefixAdmLime,params[0]);
    SCM(playerid,WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] телепортировался к транспорту ID: %i.",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/gotocar",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getherecar(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /getherecar [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid,X,Y,Z);
    SetVehiclePos(params[0],X-2,Y,Z);
    
    format(string,70,"%s Вы телепортировали к себе транспорт ID: %i.",PrefixAdmLime,params[0]);
    SCM(playerid,WHITE,string);
    format(string,sizeof(string),"%s Администратор %s[%i] телепортировал к себе транспорт ID: %i.",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/getherecar",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:cveh(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	
	new c = 0;
	for(new i = 0; i < MAX_VEHICLES; ++i) {
		if(vehicleVariable[i][vID]!=0) ++c;
	}
	
	format(string,sizeof(string),"%s Кол-во транспорта на сервере: %i",PrefixAdmLime,c);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,string,"/cveh",c);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////


CMD:gotohouse(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(sscanf(params,"i",params[0])) { format(string,sizeof(string),"%s Используйте: /gotohouse [ID дома]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	SetPlayerPos(playerid,houseVariable[params[0]][hX],houseVariable[params[0]][hY],houseVariable[params[0]][hZ]);
	
	format(string,sizeof(string),"%s Вы телепортировались к дому ID: %i",PrefixAdmLime,params[0]);
	SCM(playerid,WHITE,string);
	
	LoggingAdminAction(playerid,"","/gotohouse",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:msg(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<3) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"s[144]",params[0])) { format(string,sizeof(string),"%s Используйте: /msg [текст]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    
    format(string,sizeof(string),"%s %s %s[%i]: %s",PrefixToAllPlayers,adminVariable[playerid][aNameRank],playerVariable[playerid][pName],playerid,params[0]);
    SendToAllChatSettingAdminAction(WHITE,string);
    
    LoggingAdminAction(playerid,string,"/msg",-1,0,params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:orgonline(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<1) return SCM(playerid,WHITE,AdmNotAccess);

	new count[13];
	foreach(new i:Player) {
		switch(playerVariable[i][pOrgID]) {
			case 1: ++count[0];
			case 2: ++count[1];
			case 3: ++count[2];
			case 4: ++count[3];
			case 5: ++count[4];
			case 6: ++count[5];
			case 7: ++count[6];
			case 8: ++count[7];
			case 9: ++count[8];
			case 10: ++count[9];
			case 11: ++count[10];
			case 12: ++count[11];
		}
	}
	
	format(string,sizeof(string),"Организация\tОнлайн\n");
	for(new i = 0; i < 12; ++i) {
		format(string,sizeof(string),"%s\n%s\t%i",string,organizationVariable[i][oName],count[i]);
	}
	SPD(playerid,0,DSTH,"Онлайн организаций",string,ButtonExit,"");
	
	LoggingAdminAction(playerid,string,"/orgonline",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:mp(playerid)
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:vote(playerid) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(adminVariable[playerid][aLVL]<5) return SCM(playerid,WHITE,AdmNotAccess);
	SPD(playerid,13444,DSL,"Выборы в Правительство","\n\n\n\n\n","Выбрать","Закрыть");
	
	LoggingAdminAction(playerid,"","/vote",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:smp(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:cc(playerid) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<4) return SCM(playerid,WHITE,AdmNotAccess);
    
	foreach(new i:Player) {
		if(playerVariable[i][pAdmin]!=0) continue;
		for(new j = 0; j < 100; ++j) {
			SCM(j,WHITE,"");
		}
	}
	
	format(string,sizeof(string),"Администратор %s[%i] очистил чат.",playerVariable[playerid][pName],playerid);
	SCMtA(WHITE,string);
	
	LoggingAdminAction(playerid,string,"/cc",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:getip(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:checkip(playerid,params[])
{
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<6) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /checkip [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }

    ClearQuery();
	format(query,sizeof(query),"SELECT `RegIP` FROM `accounts` WHERE `ID` = '%i' LIMIT 1",playerVariable[params[0]][pID]);
	mysql_tquery(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)) {
		if(rows == 1) {
		    new RegIP[17];
		    cache_get_value_name(0,"RegIP",RegIP);
			format(string,sizeof(string),"%s %s[%i] | ID: %i | Регистрационный IP: %s | Текущий IP: %s",PrefixAdmLime,
			playerVariable[params[0]][pName],params[0],playerVariable[params[0]][pID],playerVariable[params[0]][pNowIP],RegIP);
			SCM(playerid,WHITE,string);
		} else { Debugging("/checkip",playerid,rows,1); }
	} else { Debugging("/checkip : cache",playerid,0,0); }
	
	LoggingAdminAction(playerid,"","/checkip",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:makeleader(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(adminVariable[playerid][aLVL]<5) return SCM(playerid,WHITE,AdmNotAccess);
	if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /makeleader [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,PlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,PlayerNotAuthorized);
	if(playerid==params[0]) return SCM(playerid,WHITE,AdmCantUseOnSelf);
	if(playerVariable[params[0]][pAdmin]>0) { format(string,sizeof(string),"%s Нельзя использовать на администраторе!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	if(playerVariable[params[0]][pOrgID]!=0) { format(string,sizeof(string),"%s Игрок состоит в организации!",PrefixAdmRed); return SCM(playerid,WHITE,string); }
	
	for(new i = 0; i < MAX_ORGANIZATIONS; ++i) {
		format(string,sizeof(string),"%s\n%s",string,organizationVariable[i][oName]);
	}
	SPD(playerid,527,DSL,"Выберите организацию",string,"Выбрать","Закрыть");
	
	LoggingAdminAction(playerid,"","/makeleader",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:maketempleader(playerid,params[])
{
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:makeadmin(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<6) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"u",params[0])) { format(string,sizeof(string),"%s Используйте: /makeadmin [ID]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(playerid==params[0]) return SCM(playerid,WHITE,AdmCantUseOnSelf);
   	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
    if(CheckSeniorAdm(playerid,params[0],"/makeadmin")==1) return 1;
    
	playerVariable[params[0]][pAdmin] = 1;
    ClearQuery();
	format(query,sizeof(query),"INSERT INTO `admins` (`ID`, `NickName`, `Password`) VALUES (%i, %s, %s)",playerVariable[params[0]][pID],
	playerVariable[params[0]][pName],"changeme");
	mysql_tquery(MySQL:DATABASE,query);
	SaveVariableInteger("account","Admin",1,playerVariable[params[0]][pID]);
	format(query,sizeof(query),"SELECT * FROM `admins` WHERE `ID` = '%i' AND `NickName` = '%s' LIMIT 1",playerVariable[params[0]][pID],playerVariable[params[0]][pName]);
	mysql_query(MySQL:DATABASE,query);
	if(cache_get_row_count(rows)==1) LoadAdminVariables(params[0]);
	
	format(string,sizeof(string),"%s Вы назначили игрока %s на пост администратора!",PrefixAdmLime,playerVariable[params[0]][pName]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Администратор %s назначил Вас на пост администратора!",PrefixAdmLime,playerVariable[playerid][pName]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] назначил игрока %s[%i] на пост администратора!",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/makeadmin",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:agiverank(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<6) return SCM(playerid,WHITE,AdmNotAccess);
    if(sscanf(params,"ui",params[0],params[1])) { format(string,sizeof(string),"%s Используйте: /agiverank [ID] [уровень]",PrefixAdmRed); return SCM(playerid,WHITE,string); }
    if(playerid==params[0]) return SCM(playerid,WHITE,AdmCantUseOnSelf);
   	if(!IsPlayerConnected(params[0])) return SCM(playerid,WHITE,AdmPlayerOffline);
	if(playerVariable[params[0]][pLogged]==false) return SCM(playerid,WHITE,AdmPlayerNotAuthorized);
	if(CheckSeniorAdm(playerid,params[0],"/agiverank")==1) return 1;
	if(!(playerVariable[playerid][pAdmin]>params[1]>=0)) { format(string,sizeof(string),"%s Выдаваемый уровень администрирования должен быть от 0 до Вашего уровня!",PrefixAdmRed); return SCM(playerid,WHITE,string); }

	playerVariable[params[0]][pAdmin] = params[1];
	SaveVariableInteger("account","Admin",params[1],playerVariable[params[0]][pID]);
	format(string,sizeof(string),"%s Вы назначили администратора %s на %i уровень!",PrefixAdmLime,playerVariable[params[0]][pName],params[1]);
	SCM(playerid,WHITE,string);
	format(string,sizeof(string),"%s Администратор %s назначил Вас на пост администратора %i уровня!",PrefixAdmLime,playerVariable[playerid][pName],params[1]);
	SCM(params[0],WHITE,string);
	format(string,sizeof(string),"%s Администратор %s[%i] назначил администратора %s[%i] на %i уровень!",
	PrefixAdmYellow,playerVariable[playerid][pName],playerid,playerVariable[params[0]][pName],params[0],params[1]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/agiverank",params[0]);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:payday(playerid,params[]) {
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
    if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
    if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
    if(playerVariable[playerid][pAdmin]<7) return SCM(playerid,WHITE,AdmNotAccess);
    
    PayDay(true);
    
	format(string,sizeof(string),"%s Администратор %s[%i] активировал PayDay.",
	PrefixAdmYellow,playerVariable[playerid][pName],playerVariable[playerid][pID]);
	SendAdminChat(playerid,WHITE,string,false);
	
	LoggingAdminAction(playerid,string,"/payday",-1);
    return 1;
}

////////////////////////////////////////////////////////////////////////////////

CMD:spawnallcars(playerid,params[]) {
	if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(playerVariable[playerid][pAdmin]==0) return SCM(playerid,WHITE,NoSuchCommand);
	if(adminVariable[playerid][aLogged]==false) return SCM(playerid,WHITE,AdmNotAuthorized);
	if(playerVariable[playerid][pAdmin]<4) return SCM(playerid,WHITE,AdmNotAccess);
	
	for(new i = 0; i < 2000; ++i) DestroyVehicle(i);
	LoadStaticVehicles();
	
	format(string,sizeof(string),"Администратор %s обновил весь транспорт на сервере",playerVariable[playerid][pName]);
	SCMtA(WHITE,string);
	
    LoggingAdminAction(playerid,string,"/spawnallcars",-1);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

















////////////////////////////////////////////////////////////////////////////////

public OnGameModeInit() {
	// MySQL
	new MySQLOpt:options = mysql_init_options();
	mysql_set_option(options,POOL_SIZE,3);
	DATABASE = mysql_connect(SQL_HOST,SQL_USER,SQL_PASS,SQL_DB,options);
	mysql_set_charset("cp1251",DATABASE);
	mysql_tquery(DATABASE,!"SET NAMES 'cp1251'","","");
	mysql_tquery(DATABASE,!"SELECT * FROM `info_server`","LoadInfoServer","");
	
	// timers
	SetTimer("Advertisement1",1000*60,true);
	SetTimer("Advertisement2",1000*50,true);
	SetTimer("UpdatePlayedTime",1000*60,true);
	SetTimer("PayDay",1000*120,true);
	SetTimer("DeacreasingFuel",1000*30,true);
	SetTimer("SystemAFK",1000,true);
	
	// init
	LoadAdminSystem();
	//LoadOrganizations();
	LoadStaticVehicles();
	LoadHouses();
	LoadBuisnesses();
	LoadJobs();
	LoadHotels();
	LoadFamilies();
	LoadPickups();
	LoadGangZones();
	
	//AddPlayerClass(45,2127.4639,2375.0969,10.8203,355.7126,0,0,0,0,0,0); // HOTEL Emerald exit
	
	AddPlayerClass(45,1686.2433,1447.7115,10.7694,270.4224,24,500,31,1000,0,0);
	CreateActor(185,1696.7897,1456.7030,11.0000,180);
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	ManualVehicleEngineAndLights(); // for auto
	CreateGlobalTextDraws();
	
	// audio
	//Audio_SetPack("default_pack",true,true);
	
	// mapping
	CO(1419,1704.65637,1453.87769,10.4,0,0,73);
	CO(994,1720.42590,1540.66028,10.5,0,0,104);
	CO(994,1721.72156,1533.93909,10.5,0,0,98);
	CO(19126,1720.68982,1537.21484,10.5,0,0,0);
	
	CDO(19373,-1100.0,416.0,500.0,0.0,0.0,0.0);
	CDO(19373,-1100.0,419.0,500.0,0.0,0.0,0.0);
	CDO(19373,-1100.0,413.0,500.0,0.0,0.0,0.0);
	CDO(19373,-1101.7,420.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1104.7,420.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1107.7,420.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1101.7,412.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1104.7,412.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1107.7,412.0,500.0,0.0,0.0,90.0);
	CDO(19373,-1109.3,413.0,500.0,0.0,0.0,0.0);
	CDO(19373,-1109.3,416.0,500.0,0.0,0.0,0.0);
	CDO(19373,-1109.3,419.0,500.0,0.0,0.0,0.0);
	CreateObject(19379,-1105.31860,416.76840,498.38,0.0,90.0,0.0);
	
	CDO(4639,1114.8934,1725.3459,11.5146,0.0,0.0,-90.0);
	
    printf("%i",heapspace());
	return 1;
}

public OnGameModeExit()															// server finishes
{
	//Audio_DestroyTCPServer();
	DisconnectMySQL();
	return 1;
}

public OnPlayerRequestClass(playerid,classid)									// Игрок увидел кнопки SPAWN, <<, >>
{
	SetPlayerWeather(playerid,17);
	SetPlayerTime(playerid,3,0);
	SetPlayerFacingAngle(playerid,0);
	SetPlayerCameraPos(playerid,2385.4634,2144.1248,23.5843);
	SetPlayerCameraLookAt(playerid,2065.4634,2144.1248,20.5843,2);
	PlayerTextDrawShow(playerid,PreviewIcon[playerid]);
	PlayerPlaySound(playerid,0,0.0,0.0,0.0);
	return 1;
}

public OnPlayerConnect(playerid) {
    ClearQuery();
	print("1. Старт сессии..");
	
	print("2. Очистка переменных..");
	RemovePlayerVariables(playerid);
	
	GetPlayerName(playerid,playerVariable[playerid][pName],MAX_PLAYER_NAME);
	printf("3. Ник аккаунта: %s",playerVariable[playerid][pName]);
	
	GetPlayerIp(playerid,playerVariable[playerid][pNowIP],16);
	printf("3. ИП аккаунта: %s",playerVariable[playerid][pNowIP]);
	
	format(query,sizeof(query),"SELECT * FROM `banip` WHERE `BannedIP` = '%s' LIMIT 1",playerVariable[playerid][pNowIP]);
	mysql_query(MySQL:DATABASE,query);
	printf("Запрос на проверку ИП: %s",query);
	
	if(cache_get_row_count(rows)) {
		if(rows == 1) {
		    format(string,sizeof(string),"%s Этот IP-адрес заблокирован!",PrefixSecurity);
			SCM(playerid,WHITE,string);
			print("3.1 ИП забанен!");
			Kick(playerid);
		} else { Debugging("OnPlayerConnect : IP address is not blocked",playerid,rows,1); }
	} else { Debugging("OnPlayerConnect : cache",playerid,0,0); }
	
	//new Float:X,Float:Y,Float:Z;
    //GetPlayerPos(playerid,X,Y,Z);
    //PlayerPlaySound(playerid,1183,X,Y,Z);

   	new globalID = CheckAccount(playerid);
    SetPlayerColor(playerid,0x33333333);
    
 	if(globalID != 0) {
 	    ClearQuery();
	    printf("4.1. Аккаунт найден! Его глобальный ИД - %i",globalID);
   		format(query,sizeof(query),"SELECT * FROM `bans` WHERE `PlayerID` = '%i' LIMIT 1",globalID);
		mysql_query(MySQL:DATABASE,query);
		
		if(cache_get_row_count(rows)) {
		    if(rows == 1) {
				new BanString[400],
					BanAdmin[24],
				    BanDays,
				    BanReason[32];
				cache_get_value_name(0,"AdminNickName",BanAdmin,24);
				cache_get_value_name_int(0,"Days",BanDays);
				cache_get_value_name(0,"Reason",BanReason,32);
				format(BanString,sizeof(BanString),"Ваш аккаунт заблокирован!\n\nАдминистратор: %s\nОсталось дней: %i\nПричина: %s",BanAdmin,BanDays,BanReason);
				SPD(playerid,12,DSM,"Оповещение",BanString,"Закрыть","");
			}
		}
        format(string,sizeof(string),LogAccount,playerVariable[playerid][pName]);
        SPD(playerid,2,DSP,"Авторизация",string,"Далее","Отмена");
    } else {
		print("4.2 Аккаунт не найден!");
        new dialog[344+MAX_PLAYER_NAME];
        format(dialog,sizeof(dialog),RegAccount,playerVariable[playerid][pName]);
        SPD(playerid,1,DSI,"Регистрация",dialog,"Далее","Отмена");
    }
    
	print("5. Приветствие..");
	//printf("6. Информация об аккаунте:\n\tID: %i\n\tNickName: %s\n\tPassword: %s",playerVariable[playerid][pID],
	//playerVariable[playerid][pName],playerVariable[playerid][pPassword]);
	
	playerVariable[playerid][pTimerEx] = SetTimerEx("PlayerUpdate",250,true,"i",playerid);
	PreviewIcon[playerid] = CreatePlayerTextDraw(playerid,540,8,"M A F I A");
	print("7. Конец входа.");
	TogglePlayerSpectating(playerid,false);
	CreatePlayersTextDraw(playerid);
	
	print("8. Загрузка остального..");
	Mapping();
	DeMapping(playerid);
	SetPlayerSkills(playerid);
 	LoadMapIcons(playerid);
 	Load3DTextLabels(playerid);
 	print("8. Остальное загружено.");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

public OnPlayerDisconnect(playerid,reason) {
	SaveAccount(playerid);
	RemovePlayerVariables(playerid);
	RemoveAdminVariables(playerid);
	print("N. Переменные очищены.");
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

public OnPlayerSpawn(playerid) {
	PreparePlayer(playerid);
	SetPlayerVirtualWorld(playerid,0);
	ShowGangZones(playerid);
	//SetPlayerCheckpoint(playerid,1696.7897,1456.7030,10.7616,1);
	//PlayerPlaySound(playerid,1186,0.0,0.0,0.0);
	return 1;
}

public OnPlayerDeath(playerid,killerid,reason)								    // Игрок умирает
{
	foreach(new i: Player) {
		if(playerVariable[i][pLogged]==false) continue;
		if(playerVariable[i][pAdmin]==0) continue;
		if(adminVariable[i][aLogged]==false) continue;
		SendDeathMessageToPlayer(i,killerid,playerid,reason);
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)												// Машина спавнтся
{
	ClearVehicle(vehicleid);
	return 1;
}

public OnVehicleDeath(vehicleid,killerid)										// Игрок взорвал машину
{
	ClearVehicle(vehicleid);
	return 1;
}

////////////////////////////////////////////////////////////////////////////////

public OnPlayerText(playerid,text[])											// Игрок пишет в чат
{
	if(playerVariable[playerid][pLogged]==false) { SCM(playerid,WHITE,NotAuthorized); return 0; }
	if(playerVariable[playerid][pMute]>0) {
		SCM(playerid,WHITE,InMute);
		SetPlayerChatBubble(playerid,"Что-то мямлит",WHITE,DISTANCE_BETWEEN_PLAYERS,5000);
		return 0;
	} else if(CheckString(text,")") || CheckString(text,":)") || CheckString(text,":-)")) {
	    new say[36];
	    format(say,sizeof(say),"%s улыбается",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,"(") || CheckString(text,":(") || CheckString(text,":-(")) {
	    new say[36];
	    format(say,sizeof(say),"%s грустит",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,"))") || CheckString(text,":D")) {
	    new say[36];
	    format(say,sizeof(say),"%s смеётся",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,"((")) {
	    new say[50];
	    format(say,sizeof(say),"%s сильно расстроился(лась)",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,"xD")) {
	    new say[50];
	    format(say,sizeof(say),"%s хохочет во весь голос",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,":P")) {
	    new say[38];
	    format(say,sizeof(say),"%s показал(а) язык",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,":O")) {
	    new say[38];
	    format(say,sizeof(say),"%s удивился(лась)",playerVariable[playerid][pName]);
	    ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
	    return 0;
	} else if(CheckString(text,"q")) {
		if(playerVariable[playerid][pAdmin]>0) {
			new say[68];
			format(say,sizeof(say),"%s показал(а) распальцовку {65FF4D}AdminsTeam",playerVariable[playerid][pName]);
			ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,say,PINK1,PINK2,PINK3,PINK4,PINK5);
			ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1,0,0,0,0,0,1);
			return 0;
		}
	}
	format(string,sizeof(string), " %s - %s[%i]",text,playerVariable[playerid][pName],playerid);
	ProxDetector(playerid,DISTANCE_BETWEEN_PLAYERS,string,WHITE1,WHITE2,WHITE3,WHITE4,WHITE5);
	return 0;
}

public OnPlayerCommandText(playerid,cmdtext[])									// Игрок использовал команду
{
    return SCM(playerid,WHITE,NoSuchCommand);
}

public OnPlayerEnterVehicle(playerid,vehicleid,ispassenger)				    	// Игрок входит в авто (двигатель, фары, сигнализация, замок, топливо)
{
	if(ispassenger==0) {
		if(vehicleVariable[vehicleid][vLock]==false) {
			GameTextForPlayer(playerid,"vehicle is closed",3000,4);
			//sbiv anim
		}
	}
	if(ispassenger == 0) {
		if(vehGovern[0]<=vehicleid<=vehGovern[sizeof(vehGovern)-1]) { if(playerVariable[playerid][pOrgID]!=1) { format(string,sizeof(string),"%s Вы не сотрудник Правительства!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehFBI[0]<=vehicleid<=vehFBI[sizeof(vehFBI)-1]) { if(playerVariable[playerid][pOrgID]!=2) { format(string,sizeof(string),"%s Вы не сотрудник ФБР!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehPolice[0]<=vehicleid<=vehPolice[sizeof(vehPolice)-1]) { if(playerVariable[playerid][pOrgID]!=3) { format(string,sizeof(string),"%s Вы не сотрудник Полицейского Департамента!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehArmy[0]<=vehicleid<=vehArmy[sizeof(vehArmy)-1]) { if(playerVariable[playerid][pOrgID]!=4) { format(string,sizeof(string),"%s Вы не сотрудник Национальной гвардии!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehHospital[0]<=vehicleid<=vehHospital[sizeof(vehHospital)-1]) { if(playerVariable[playerid][pOrgID]!=5) { format(string,sizeof(string),"%s Вы не сотрудник Центральной больницы!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehNews[0]<=vehicleid<=vehNews[sizeof(vehNews)-1]) { if(playerVariable[playerid][pOrgID]!=6) { format(string,sizeof(string),"%s Вы не сотрудник Новостного агенства!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehDriveSchool[0]<=vehicleid<=vehDriveSchool[sizeof(vehDriveSchool)-1]) { if(playerVariable[playerid][pOrgID]!=7) { format(string,sizeof(string),"%s Вы не сотрудник Автошколы!",PrefixPlayerError); return SCM(playerid,WHITE,string); }}
		else if(vehTaxi[0]<=vehicleid<=vehTaxi[sizeof(vehTaxi)-1]) {
			if(playerVariable[playerid][pJobID]!=2) {
				SCM(playerid,WHITE,NotInJobTaxi);
				return 1;
			} else {
				if(GetPVarInt(playerid,"RentCar") == 0) {
				    format(string,sizeof(string),DoYouWantToRentCar,1500);
					SPD(playerid,3101,DSM,"Работа такси",string,"Далее","Закрыть");
					print("7545");
				} else {
					SCM(playerid,WHITE,YouHaveRentCar);
				}
			}
		}
		else if(vehBus[0]<=vehicleid<=vehBus[sizeof(vehBus)-1]) {
			if(playerVariable[playerid][pJobID]!=3) {
				SCM(playerid,WHITE,NotInJobTrashmaster);
				return 1;
			} else {
				if(GetPVarInt(playerid,"RentCar") == 0) {
				    format(string,sizeof(string),DoYouWantToRentCar,1750);
				    SPD(playerid,3201,DSM,"Работа водителя мусоровоза",string,"Далее","Закрыть");
				    print("7560");
				} else {
					SCM(playerid,WHITE,YouHaveRentCar);
				}
			}
		} else if(vehSwepper[0]<=vehicleid<=vehSwepper[sizeof(vehSwepper)-1]) {
			if(playerVariable[playerid][pJobID]!=8) {
				SCM(playerid,WHITE,NotInJobSwepper);
			} else {
				if(GetPVarInt(playerid,"RentCar") == 0) {
					format(string,sizeof(string),DoYouWantToRentCar,1300);
					SPD(playerid,3801,DSM,"Работа чистильщика дорог",string,"Далее","Закрыть");
					print("7572");
				} else {
				    SCM(playerid,WHITE,YouHaveRentCar);
				}
			}
		} else if(vehScooters[0]<=vehicleid<=vehScooters[sizeof(vehScooters)-1]) {
			if(GetPVarInt(playerid,"RentCar")!=0) {
				SCM(playerid,WHITE,YouHaveRentCar);
			} else {
				format(string,sizeof(string),DoYouWantToRentCar,250);
				SPD(playerid,32000,DSM,"Аренда скутера",string,"Далее","Закрыть");
				print("7675");
			}
		}
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)									// Игрок выходит из авто
{
	return 1;
}

public OnPlayerStateChange(playerid,newstate,oldstate)				      		// Игрок сменил статус (пасажир,пешеход,водитель)
{
	if(newstate==PLAYER_STATE_WASTED) {
		if(playerVariable[playerid][pCash]>0) {
			GivePlayerMoney(playerid,100);
			playerVariable[playerid][pCash]+=100;
			return 1;
		}
	} else if(newstate==PLAYER_STATE_DRIVER) {
        new carID = GetPlayerVehicleID(playerid);
        GetPlayerPos(playerid,vehicleVariable[carID][vX],vehicleVariable[carID][vY],vehicleVariable[carID][vZ]);
        TextDrawShowForPlayer(playerid,SBox);
        TextDrawShowForPlayer(playerid,SBox1);
        PlayerTextDrawShow(playerid,CarSpeed[playerid]);
        PlayerTextDrawShow(playerid,CarFuel[playerid]);
        PlayerTextDrawShow(playerid,CarMilliage[playerid]);
        PlayerTextDrawShow(playerid,CarLights[playerid]);
        PlayerTextDrawShow(playerid,CarEngine[playerid]);
        SpeedTimer[playerid] = SetTimerEx("UpdateSpeed",200,1,"d",playerid);
        
        format(string,sizeof(string),"%s Используйте /cmenu для управления транспортом",PrefixHint);
		SCM(playerid,WHITE,string);
		format(string,sizeof(string),"%s L.CTRL - завести/заглушить двигатель  |  L.ALT - вкл/выкл фары",PrefixHint);
		SCM(playerid,WHITE,string);
		return 1;
	}
	
	if(oldstate==PLAYER_STATE_DRIVER) {
	    TextDrawHideForPlayer(playerid,SBox);
	    TextDrawHideForPlayer(playerid,SBox1);
	    PlayerTextDrawHide(playerid,CarSpeed[playerid]);
	    PlayerTextDrawHide(playerid,CarFuel[playerid]);
	    PlayerTextDrawHide(playerid,CarMilliage[playerid]);
	    PlayerTextDrawHide(playerid,CarLights[playerid]);
	    PlayerTextDrawHide(playerid,CarEngine[playerid]);
	    KillTimer(SpeedTimer[playerid]);
	    return 1;
	} else if(oldstate==PLAYER_STATE_ONFOOT) {

	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)										// Игрок вошёл в чекпоинт
{
	if(onCheckpoint[playerid][0]==true) {
	    DialogQuests(playerid,0);
	} else {
		SCM(playerid,WHITE,"you are on checkpoint!");
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)										// Игрок покинул чекпоинт
{
	onCheckpoint[playerid][0] = false;
	SCM(playerid,WHITE,"you left checkpoint!");
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)									// Игрок вошёл в гоночный чекпоинт
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)									// Игрок покинул гоночный чекпоинт
{
	return 1;
}

public OnRconCommand(cmd[])														// Использование RCON команд
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)											// Игрок изменил спавн
{
	return 1;
}

public OnObjectMoved(objectid)													// Объект движется
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)									// Объект игрока движется
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)									// Игрок наступил на пикап
{
	if(pickupid==PICKUPS[0]) {
		SetPlayerPos(playerid,384.808624,173.804992,1008.3828);
		SetPlayerFacingAngle(playerid,90.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[1]) {
		SetPlayerPos(playerid,344.6306,176.5382,1014.1875);
		SetPlayerFacingAngle(playerid,180.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[2]) {
		SetPlayerPos(playerid,1039.0498,1017.2746,11.0000);
		SetPlayerFacingAngle(playerid,0.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[3]) {
		SetPlayerPos(playerid,1059.2025,1005.6715,27.1568);
		SetPlayerFacingAngle(playerid,-90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[4] || pickupid==PICKUPS[8]) SPD(playerid,270,DSL,"Продукты на складе Правительства",string_ORG_FOOD,"Выбрать","Закрыть");
	else if(pickupid==PICKUPS[5]) SPD(playerid,100,DSM,"Информация","wefrerthyj","Закрыть","");
	else if(pickupid==PICKUPS[6]) {
		if(playerVariable[playerid][pOrgID]!=1) return SCM(playerid,WHITE,NotInGovern);
		SetPlayerArmour(playerid,100.0);
		playerVariable[playerid][pArmour]=100.0;
	} else if(pickupid==PICKUPS[7]) {
		if(playerVariable[playerid][pOrgID]!=1) return SCM(playerid,WHITE,NotInGovern);
		SPD(playerid,101,DSL,"Выберите оружие","1. Дубинка\n2. Пистолет Desert Eagle","Выбрать","Закрыть");
	} else if(pickupid==PICKUPS[9]) {
		if(playerVariable[playerid][pOrgID]!=1) return SCM(playerid,WHITE,NotInGovern);
		if(playerVariable[playerid][pOrgWorking]==true) SPD(playerid,102,DSM,"Переодеться",FORM_OUTPUT,"Снять","Закрыть");
		else SPD(playerid,103,DSM,"Переодеться",FORM_PUT,"Одеть","Закрыть");
	} else if(pickupid==PICKUPS[10]) {
		if(playerVariable[playerid][pOrgID]!=1) return SCM(playerid,WHITE,NotInGovern);
		if(playerVariable[playerid][pHeal]>=100) return SCM(playerid,WHITE,"[{8BFFF3}Подсказка{FFFFFF}] Вы здоровы!");
		SPD(playerid,104,DSM,"Лечение","Вы действительно хотите пройти лечение?","Начать","Закрыть");
	} else if(pickupid==PICKUPS[20]) {
		SetPlayerPos(playerid,238.5722,141.8702,1003.0234);
		SetPlayerFacingAngle(playerid,0.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[21]) {
		SetPlayerPos(playerid,211.0084,142.1878,1003.0234);
		SetPlayerFacingAngle(playerid,-90.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[22]) {
		SetPlayerPos(playerid,239.7759,195.7819,1008.1719);
		SetPlayerFacingAngle(playerid,-90.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[23]) {
		SetPlayerPos(playerid,2290.1116,2428.1799,10.8203);
		SetPlayerFacingAngle(playerid,180.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[24]) {
		SetPlayerPos(playerid,2293.5256,2451.5066,10.8203);
		SetPlayerFacingAngle(playerid,90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[25]) {
    	SetPlayerPos(playerid,2255.2314,2453.8542,38.6837);
		SetPlayerFacingAngle(playerid,90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[26]) {
		SetPlayerPos(playerid,2127.4,2375.1,10.8203);
		SetPlayerFacingAngle(playerid,180.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[40]) {
	    if(playerVariable[playerid][pOrgID]==2 || GetPVarInt(playerid,"FBIkey") == 1 || playerVariable[playerid][pAdmin] > 0) {
			SetPlayerPos(playerid,246.4444,110.0290,1003.2257);
			SetPlayerFacingAngle(playerid,0.0);
			SetPlayerInterior(playerid,10);
			SetPlayerVirtualWorld(playerid,1);
			SetCameraBehindPlayer(playerid);
		} else {
		    format(string,sizeof(string),"%s У Вас нет ключ-доступа к этой двери!",PrefixPlayerError);
			SCM(playerid,WHITE,string);
		}
	} else if(pickupid==PICKUPS[41]) {
	    if(playerVariable[playerid][pOrgID]==2 || GetPVarInt(playerid,"FBIkey") == 1 || playerVariable[playerid][pAdmin] > 0) {
			SetPlayerPos(playerid,215.5548,123.0535,1003.2188);
			SetPlayerFacingAngle(playerid,180.0);
			SetPlayerInterior(playerid,10);
			SetPlayerVirtualWorld(playerid,1);
			SetCameraBehindPlayer(playerid);
		} else {
		    format(string,sizeof(string),"%s У Вас нет ключ-доступа к этой двери!",PrefixPlayerError);
			SCM(playerid,WHITE,string);
		}
	} else if(pickupid==PICKUPS[42]) {
	    if(playerVariable[playerid][pOrgID]==2 || GetPVarInt(playerid,"FBIkey") == 1 || playerVariable[playerid][pAdmin] > 0) {
			SetPlayerPos(playerid,235.4032,114.8696,1010.2188);
			SetPlayerFacingAngle(playerid,90.0);
			SetPlayerInterior(playerid,10);
			SetPlayerVirtualWorld(playerid,1);
			SetCameraBehindPlayer(playerid);
		} else {
		    format(string,sizeof(string),"%s У Вас нет ключ-доступа к этой двери!",PrefixPlayerError);
			SCM(playerid,WHITE,string);
		}
	} else if(pickupid==PICKUPS[43]) {
		SetPlayerPos(playerid,2443.8628,2376.2234,11.9550);
		SetPlayerFacingAngle(playerid,90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[44]) {
		SetPlayerPos(playerid,2491.3599,2397.3115,4.2109);
		SetPlayerFacingAngle(playerid,-90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[45]) {
    	SetPlayerPos(playerid,2490.5127,2385.1880,71.0496);
		SetPlayerFacingAngle(playerid,-90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[80]) {
		SetPlayerPos(playerid,973.1729,-8.8705,1001.1484);
		SetPlayerFacingAngle(playerid,0.0);
		SetPlayerInterior(playerid,3);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[83]) {
		SetPlayerPos(playerid,1607.0051,1820.4598,10.8280);
		SetPlayerFacingAngle(playerid,0.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[140]) {
		SetPlayerPos(playerid,2308.1917,-15.9908,26.7496);
		SetPlayerFacingAngle(playerid,270.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,1);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[141]) {
		SetPlayerPos(playerid,2359.7690,2377.6091,10.8203);
		SetPlayerFacingAngle(playerid,90.0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetCameraBehindPlayer(playerid);
	} else if(pickupid==PICKUPS[142] || pickupid==PICKUPS[143] || pickupid==PICKUPS[144] || pickupid==PICKUPS[145]) {
		DialogBank(playerid,0);
	} else if(pickupid==PICKUPS[500]) {
		format(string,sizeof(string),"Работа {FF4D65}грузчика{FFFFFF}.");
		SPD(playerid,32000,DSM,"Работа грузчика",string,"Закрыть","");
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)							// Смена наклеек
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)						// Перекраска (тюнинг)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)					// Перекраска (тюнинг)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)									// Происходит действие в меню
{
	return 1;
}

public OnPlayerExitedMenu(playerid)												// Происходит сокрытие меню
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)			// Игрок сменил интерьер
{
	return 1;
}

public OnPlayerKeyStateChange(playerid,newkeys,oldkeys)						// Игрок нажал на кнопку
{
    if(playerVariable[playerid][pLogged]==false) return SCM(playerid,WHITE,NotAuthorized);
	if(newkeys==KEY_ACTION) {
		if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER) {
			new carID = GetPlayerVehicleID(playerid);
			switch(vehicleVariable[carID][vEngine]) {
				case false: {
				    if(vehicleVariable[carID][vFuel]==0) {
				        format(string,sizeof(string),"%s В этом транспорте закончилось топливо.",PrefixPlayerError);
				        SCM(playerid,WHITE,string);
					} else {
					    vehicleVariable[carID][vEngine]=true;
					    SetVehicleParams(carID);
						format(string,sizeof(string),"%s завел(а) двигатель",playerVariable[playerid][pName]);
						ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
					}
					return 1;
				}
				case true: {
				    vehicleVariable[carID][vEngine]=false;
					SetVehicleParams(carID);
					format(string,sizeof(string),"%s заглушил(а) двигатель",playerVariable[playerid][pName]);
					ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
					return 1;
				}
			}
		}
	} else if(newkeys==KEY_FIRE) {
        if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER) {
			new carID = GetPlayerVehicleID(playerid);
			switch(vehicleVariable[carID][vLights]) {
				case false: {
					vehicleVariable[carID][vLights]=true;
					SetVehicleParams(carID);
					format(string,sizeof(string),"%s включил(а) фары",playerVariable[playerid][pName]);
					ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
					return 1;
				}
				case true: {
					vehicleVariable[carID][vLights]=false;
					SetVehicleParams(carID);
					format(string,sizeof(string),"%s выключил(а) фары",playerVariable[playerid][pName]);
					ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
					return 1;
				}
			}
		}
	} else if(newkeys==KEY_ANALOG_LEFT) {
		if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER) {
			new carID = GetPlayerVehicleID(playerid);
			switch(vehicleVariable[carID][vTurnLeft]) {
				case false: {
					vehicleVariable[carID][vTurnLeft]=true;
					new light1 = CreateObject(19294,0.0,0.0,0.0,0.0,0.0,0.0);
					new light2 = CreateObject(19294,0.0,0.0,0.0,0.0,0.0,0.0);
					vehicleVariable[carID][vLeftID1]=light1;
					vehicleVariable[carID][vLeftID2]=light2;
					AttachObjectToVehicle(light1,carID,0.0,0.0,0.0,0.0,0.0,0.0);
					AttachObjectToVehicle(light2,carID,0.0,0.0,0.0,0.0,0.0,0.0);
					return 1;
				}
				case true: {
					vehicleVariable[carID][vTurnLeft]=false;
					DestroyObject(vehicleVariable[carID][vLeftID1]);
					DestroyObject(vehicleVariable[carID][vLeftID2]);
					vehicleVariable[carID][vLeftID1]=EOS;
					vehicleVariable[carID][vLeftID2]=EOS;
					return 1;
				}
			}
		}
	} else if(newkeys==KEY_ANALOG_RIGHT) {
	    if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER) {
			new carID = GetPlayerVehicleID(playerid);
			switch(vehicleVariable[carID][vTurnRight]) {
				case false: {
					vehicleVariable[carID][vTurnRight] = false;
					vehicleVariable[carID][vRightID1] = CreateObject(19294,0.0,0.0,0.0,0.0,0.0,0.0);
					vehicleVariable[carID][vRightID2] = CreateObject(19294,0.0,0.0,0.0,0.0,0.0,0.0);
					AttachObjectToVehicle(vehicleVariable[carID][vRightID1],carID,0.0,0.0,0.0,0.0,0.0,0.0);
					AttachObjectToVehicle(vehicleVariable[carID][vRightID2],carID,0.0,0.0,0.0,0.0,0.0,0.0);
					return 1;
				}
				case true: {
					vehicleVariable[carID][vTurnRight]=false;
					DestroyObject(vehicleVariable[carID][vRightID1]);
					DestroyObject(vehicleVariable[carID][vRightID2]);
					vehicleVariable[carID][vRightID1]=EOS;
					vehicleVariable[carID][vRightID2]=EOS;
					return 1;
				}
			}
		}
	} else if(newkeys==KEY_WALK) {
	    if(GetPlayerState(playerid)==PLAYER_STATE_ONFOOT) {
			for(new i = 0; i < MAX_TRASHCANS; ++i) {
				if(PlayerToPoint(playerid,trashcanVariable[i][tX],trashcanVariable[i][tY],trashcanVariable[i][tZ])<=DISTANCE_BETWEEN_ACTION) {
					printf("opened trashcan N %i",i);
					return 1;
				}
			}
			for(new i = 0; i < MAX_PERSONS; ++i) {
				if(PlayerToPoint(playerid,actorVariable[i][aX],actorVariable[i][aY],actorVariable[i][aZ])<=DISTANCE_BETWEEN_ACTION) {
					printf("said to actor N %i",i);
					return 1;
				}
			}
		} else if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER) {

		}
	} else if(newkeys == KEY_YES) {
		//if(GetPVarInt(playerid,"offer")==0) { format(string,sizeof(string),"%s У Вас нет активных предложений!",PrefixPlayerError); SCM(playerid,WHITE,string);}
		if(GetPVarInt(playerid,"healIDgetter") != 0) {
		    new senderID = GetPVarInt(playerid,"healIDgetter") - 1;
		    
			SetPlayerHealth(playerid,100.0);
			playerVariable[playerid][pHeal] = 100.0;
			
			format(string,sizeof(string),"%s Вы успешно прошли курс лечения!",PrefixHint);
			SCM(playerid,WHITE,string);
			
			format(string,sizeof(string),"%s %s согласился(лась) пройти курс лечения за %i$.",PrefixHint,playerVariable[playerid][pName],PRICE_HEAL / 2);
			SCM(senderID,WHITE,string);
			
			ChangeMoney(playerid,-PRICE_HEAL / 2);
			ChangeMoney(senderID,PRICE_HEAL / 2);
			
			DeletePVar(playerid,"healIDgetter");
			DeletePVar(senderID,"healIDsender");
		}
 	} else if(newkeys == KEY_NO) {
		if(GetPVarInt(playerid,"healIDgetter") != 0) {
			new senderID = GetPVarInt(playerid,"healIDgetter");
			
			format(string,sizeof(string),"%s Вы отказались пройти курс лечения!",PrefixHint);
			SCM(playerid,WHITE,string);
			
			format(string,sizeof(string),"%s %s отказался(лась) пройти курс лечения за %i$.",PrefixHint,playerVariable[playerid][pName],PRICE_HEAL / 2);
			SCM(playerid,WHITE,string);
			
			DeletePVar(playerid,"healIDgetter");
			DeletePVar(senderID,"healIDsender");
		} else if(GetPVarInt(playerid,"healdrugIDgetter") != 0) {

		}
	} else if(newkeys == KEY_CTRL_BACK) {
	    if(playerVariable[playerid][pOpenedInventory]==true) return 1;
	    OpenInventory(playerid);
	    playerVariable[playerid][pOpenedInventory] = true;
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)							// Вызывается при RCON логине
{
	//format(string,sizeof(string),"%s %s[%i] авторизовался в RCON!",PrefixSecurity,playerVariable[playerid][pName],playerid);
	//SendAdminChat(playerid,WHITE,string);
	return 1;
}

public OnPlayerUpdate(playerid)													// Таймер который не работает только при АФК через ESC
{
	foreach(new i: Player) {
		playerVariable[i][pAFK] = 0;
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)							// Игрок кликнул на глобальный текстдрав
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)			// Игрок кликнул на свой текстдрав
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)									// Один игрок увидел иного
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)									// Один игрок перестал видеть иного
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)								// Один игрок увидел авто
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)								// Один игрок перестал видеть авто
{
	return 1;
}

public OnPlayerCommandPerformed(playerid,cmdtext[],success)
{
	if(success==-1) return SCM(playerid,WHITE,NoSuchCommand);
	return 1;
}

public OnDialogResponse(playerid,dialogid,response,listitem,inputtext[]) {
    switch(dialogid) {
		case 1: {
            if(!response) {
                format(string,sizeof(string),"%s Введите /q(uit), чтобы выйти из игры.",PrefixPlayerError);
                SCM(playerid,WHITE,string);
                Kick(playerid);
                return 1;
			}
   			if(strlen(inputtext) < 6 || strlen(inputtext) > 32) {
                new dialog[380+24+10];
                format(dialog,sizeof(dialog),RegAccount,playerVariable[playerid][pName]);
                SPD(playerid,1,DSI,"Регистрация",dialog,"Далее","Отмена");
                return 1;
			}
			CreateAccount(playerid,inputtext);
			SpawnPlayer(playerid);
			return 1;
    	} case 2: {
            if(!response || strlen(inputtext)==0) {
                format(string,sizeof(string),"%s Введите /q(uit), чтобы выйти из игры.",PrefixPlayerError);
                SCM(playerid,WHITE,string);
                Kick(playerid);
                return 1;
			}
			if(playerVariable[playerid][pWrongPassword]==2) {// && strcmp(playerVariable[playerid][pPassword],inputtext,true)) {
				SPD(playerid,3,DSM,"Ошибка авторизации!","Вы использовали 3 попытки для авторизации, за что были кикнуты!\n\n\nС уважением, команда Mafia Role Play!","Выйти","");
				Kick(playerid);
				return 1;
			}
			LoadAccount(playerid,inputtext);
      		//if(!strcmp(playerVariable[playerid][pPassword],inputtext,true)) LoadAccount(playerid,inputtext);
      		//} else {
			//	playerVariable[playerid][pWrongPassword]++;
	        //    new dialog[140+MAX_PLAYER_NAME];
            //  	format(dialog,sizeof(dialog),LogAccount,playerVariable[playerid][pName]);
            //    SPD(playerid,2,DSP,"Авторизация",dialog,"Войти","Отмена");
            //    return 1;
      		//}
      		SpawnPlayer(playerid);
      		format(string,sizeof(string),"~w~welcome~n~~r~%s",playerVariable[playerid][pName]);
			GameTextForPlayer(playerid,string,5000,1);
        } case 3: {
            if(!response || listitem==0) playerVariable[playerid][pSex] = false;
			else playerVariable[playerid][pSex] = true;
			SaveVariableBool("account","Sex",playerVariable[playerid][pSex],playerVariable[playerid][pID]);
			return 1;
		}
		case 4: {
			if(!response || listitem==0) playerVariable[playerid][pSkinColor] = false;
			else playerVariable[playerid][pSkinColor] = true;
			SaveVariableBool("account","SkinColor",playerVariable[playerid][pSkinColor],playerVariable[playerid][pID]);
			return 1;
		}
		case 5: {
			if(!response) playerVariable[playerid][pWhereKnew] = 0;
			else playerVariable[playerid][pWhereKnew] = listitem + 1;
			SaveVariableString("account","WhereKnew",playerVariable[playerid][pWhereKnew],playerVariable[playerid][pID]);
			return 1;
		}
		case 6: {
			new promocode[24];
			if(!response) {
                strmid(promocode,"",0,24,24);
			} else {
				strmid(promocode,inputtext,0,24,24);
			}
			SaveVariableString("account","Promocode",promocode,playerVariable[playerid][pID]);
			return 1;
		}
		case 7: {
            Kick(playerid);
            return 1;
		}
		case 8: {
		    return 1;
		}
		case 9: {
			return 1;
		}
		case 10: {
			Kick(playerid);
			return 1;
		}
		case 11: {
			Kick(playerid);
			return 1;
		}
		case 12: {
			Kick(playerid);
			return 1;
		}
		case 13: {
		    return 1;
		}
		case 17: {
			if(response) return DialogDir(playerid,0);
			else return 1;
		}
		case 20: {
		    if(response) {
				switch(listitem) {
				    case 0: {
						new list[512];
						format(list,sizeof(list),"Имя:\t\t\t%s\nУровень:\t\t%i\nОпыт:\t\t\t%i из %i\nПол:\t\t\t%s\nНомер телефона:\t\t%i\nСупруг(а):\t\t%s\n\n\n\n\n\n\n\n\n\n\n",
						playerVariable[playerid][pName],playerVariable[playerid][pLVL],playerVariable[playerid][pEXP],(playerVariable[playerid][pLVL]+1)*2,
						playerVariable[playerid][pSex],playerVariable[playerid][pPhoneNumber],playerVariable[playerid][pSpouse]);
						SPD(playerid,21,DSM,"Статистика аккаунта",list,"Назад","Закрыть");
					}
					case 1: {}
					case 2: {}
					case 3: {}
					case 4: {}
				}
			} else {

			}
			return 1;
		}
		case 21: {
			if(response) {

			} else {
				DialogMenu(playerid,0);
			}
			return 1;
		}
		case 22:
		{
			if(response)
			{

			}
			else DialogMenu(playerid,0);
			return 1;
		}
		case 23:
		{
			return 1;
		}
		case 24:
		{
			return 1;
		}
		case 25:
		{
			return 1;
		}
		case 30:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: return 1;
					case 1: return 1;
				}
			}
			else return 1;
			return 1;
		}
		case 33:
		{
			return 1;
		}
		case 35:
		{
			return 1;
		}
		case 36:
		{
			return 1;
		}
		case 37:
		{
		    return 1;
		}
		case 38:
		{
			return 1;
		}
		case 39:
		{
			return 1;
		} case 55: {
			if(response) {
			    if(listitem==0) return SPD(playerid,17,DSM,"О проекте","Mafia Role Play - игровой проект в SAMP индустрии.....События проходят в 1972 году. В это время мафиозные семьи ....","Назад","Закрыть");
			    if(listitem==1) return SPD(playerid,17,DSTH,"Телефонная книга","Имя\tНомер\n1\t1","Назад","Закрыть");
			    if(listitem==2) return SPD(playerid,17,DSTH,"Важные номера","Организация\tНомер\nСлужба спасения\t911\nПравительство\t800\nРадиоцентр\t222\nТакси\t500\nБаланс\t100","Назад","Закрыть");
			    if(listitem==3) {
			        new list[2560];
			        format(query,sizeof(query),"SELECT * FROM `Notes` WHERE `ID` = %i LIMIT 1",playerVariable[playerid][pID]);
			        mysql_query(MySQL:DATABASE,query);
			        for(new i=1;i<11;++i) {
						new note[258],title[7];
						format(title,sizeof(title),"Note%i",i);
						cache_get_value_name(0,title,note,256);
						format(note,sizeof(list),"%s\n",note);
						strcat(list,note);
					}
					return SPD(playerid,56,DSL,"Заметки",list,"Изменить","Назад");
				}
			    if(listitem==4)
				{
				    new list[512] = "Имя\tНомер\n";
				    foreach(new i:Player)
				    {
				        if(!IsPlayerConnected(i)) continue;
						if(playerVariable[i][pLogged]==false) continue;
				        if(playerVariable[i][pJobID]!=8) continue;
				        new person[64];
				        format(person,sizeof(person),"%s\t%i\n",playerVariable[i][pName],playerVariable[i][pPhoneNumber]);
				        strcat(list,person);
					}
					return SPD(playerid,17,DSTH,"Адвокаты",list,"Назад","Закрыть");
				}
			}
			else return 1;
		}
		case 56:
		{
			if(response)
			{
			    new note[256],note2[300],title[7];
			    format(title,sizeof(title),"Note%i",listitem+1);
			    format(query,sizeof(query),"SELECT `%s` FROM `Notes` WHERE `ID` = %i LIMIT 1",title,playerVariable[playerid][pID]);
			    mysql_query(MySQL:DATABASE,query);
			    cache_get_value_name(0,title,note,256);
			    format(note2,sizeof(note2),"Ваша заметка: %s",note);
			    return SPD(playerid,57,DSI,"Измение заметки",note2,"Сохранить","Назад");
			}
			else DialogDir(playerid,0);
			return 1;
		}
		case 57:
		{
			if(response)
			{

			}
			else DialogDir(playerid,0);
			return 1;
		}
		case 62: {
			if(response) {
			    new carID = GetPlayerVehicleID(playerid);
			    switch(listitem) {
			        case 1: {
						if(vehicleVariable[carID][vEngine]==true) {
							vehicleVariable[carID][vEngine]=false;
							format(string,sizeof(string),"%s завел двигатель",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						} else {
							vehicleVariable[carID][vEngine]=true;
							format(string,sizeof(string),"%s заглушил двигатель",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						}
					} case 2: {
						if(vehicleVariable[carID][vBonnet]==true) {
							vehicleVariable[carID][vBonnet]=false;
							format(string,sizeof(string),"%s закрыл капот",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						} else {
							vehicleVariable[carID][vBonnet]=true;
							format(string,sizeof(string),"%s открыл капот",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						}
				    } case 3: {
						if(vehicleVariable[carID][vBoot]==true) {
							vehicleVariable[carID][vBoot]=false;
							format(string,sizeof(string),"%s закрыл багажник",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						} else {
							vehicleVariable[carID][vBoot]=true;
							format(string,sizeof(string),"%s открыл багажник",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						}
					} case 4: {
					    if(vehicleVariable[carID][vLights]==true) {
							vehicleVariable[carID][vLights]=false;
							format(string,sizeof(string),"%s включил фары",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						} else {
							vehicleVariable[carID][vLights]=true;
							format(string,sizeof(string),"%s выключил фары",playerVariable[playerid][pName]);
							ProxDetector(playerid,30.0,string,PINK1,PINK2,PINK3,PINK4,PINK5);
						}
					}
				}
				SetVehicleParams(carID);
				DialogCmenu(playerid,0,carID);
			}
			return 1;
		}
		case 63: {
			if(response) {
				if(strlen(inputtext)==0) {

				} else {
					format(string,sizeof(string),"%s Ваша жалоба отправлена администрации.",PrefixHint);
					SCM(playerid,WHITE,string);
					format(string,sizeof(string),"%s %s",PrefixHint,inputtext);
					SCM(playerid,WHITE,string);
					
					//format(reportMessages[playerid],sizeof(reportMessages[playerid]),inputtext);
					reportTimers[playerid] = 30;
				}
			}
			return 1;
		}
		case 113:
		{
			return 1;
		}
		case 240:
		{
			if(response)
			{
				return 1;
			}
			else return 1;
		}
		case 260:
		{
			return 1;
		}
		case 262: {
			if(response) {
				if(listitem==0) return SPD(playerid,263,DSM,"Статистика организации","йцуакпуекрнеогн","Назад","Закрыть");
				if(listitem==1) return SPD(playerid,263,DSTH,"Члены организации онлайн","werty","Назад","Закрыть");
				if(listitem==2) return SPD(playerid,263,DSTH,"Члены организации оффлайн","wdergty","Назад","Закрыть");
			}
			else return 1;
		} case 263: {
			if(response) {
				DialogLmenu(playerid,listitem + 1);
			} else {

			}
			return 1;
		} case 270:
		{
			if(response)
			{
				return 1;
			}
			else return 1;
		}
		case 380:
		{
		    if(response)
		    {
				return 1;
			}
			else return 1;
		}
		case 400:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: DialogBank(playerid,1);
					case 1: DialogBank(playerid,2);
					case 2: DialogBank(playerid,3);
					case 3: DialogBank(playerid,4);
					case 4: DialogBank(playerid,5);
					case 5: DialogBank(playerid,6);
	 				case 6: DialogBank(playerid,7);
	 				case 7: DialogBank(playerid,8);
	 				case 8: DialogBank(playerid,9);
	 				case 9: DialogBank(playerid,10);
				}
			}
			return 1;
		}
		case 401:
		{
		    DialogBank(playerid,0);
			return 1;
		}
		case 402:
		{
			if(response)
			{
				if(strlen(inputtext)==0) return DialogBank(playerid,2);
				new number_ = strval(inputtext);
				if(number_)
				{
				    if(!(1<=number_<=playerVariable[playerid][pCash])) return DialogBank(playerid,2);
					playerVariable[playerid][pCash]-=number_;
					playerVariable[playerid][pBankCash]+=number_;
					GivePlayerMoney(playerid,-number_);
					format(string,sizeof(string),"%s Вы успешно пополнили баланс на %i$!",PrefixHint,number_);
					SCM(playerid,WHITE,string);
				} else return DialogBank(playerid,2);
			}
			else DialogBank(playerid,0);
			return 1;
		}
		case 403:
		{
			if(response)
			{
				if(strlen(inputtext)==0) return DialogBank(playerid,3);
				new number_ = strval(inputtext);
				if(number_)
				{
				    if(!(1<=number_<=playerVariable[playerid][pBankCash])) return DialogBank(playerid,3);
					playerVariable[playerid][pCash]+=number_;
					playerVariable[playerid][pBankCash]-=number_;
					GivePlayerMoney(playerid,number_);
					format(string,sizeof(string),"%s Вы успешно сняли с баланса %i$!",PrefixHint,number_);
					SCM(playerid,WHITE,string);
				} else return DialogBank(playerid,3);
			}
			else DialogBank(playerid,0);
			return 1;
		}
		case 555: {
			if(response) {
			    DialogQuests(playerid,listitem + 1);
			} else {

			}
			return 1;
		}
		case 556: {
		    if(response) {
				DialogQuests(playerid,listitem + 1);
			} else {
				DialogQuests(playerid,0);
			}
			return 1;
		}
		case 3101: {
			if(response) {
				format(string,sizeof(string),"Вы успешно арендовали это авто!");
				SCM(playerid,WHITE,string);
				playerVariable[playerid][pJobWorking] = true;
				SetPVarInt(playerid,"RentCar",GetPlayerVehicleID(playerid));
			} else {
				format(string,sizeof(string),"Вы отказались от аренды такси!");
				SCM(playerid,WHITE,string);
			}
			return 1;
		}
		case 3201: {
			if(response) {
				SCM(playerid,WHITE,AccessRentCar);
				format(string,sizeof(string),"%s Вы начали рабочий день. Двигайтесь по улицам города и собирайте весь мусор из баков.",PrefixJob);
				SCM(playerid,WHITE,string);
				format(string,sizeof(string),"%s После того, как Ваш грузовик будет заполнен, езжайте в д.Fort-Carson и выгрузите весь мусор.",PrefixJob);
				SCM(playerid,WHITE,string);
				format(string,sizeof(string),"%s Ваша зарплата будет начислена Вам на банковский счет. Удачной работы!",PrefixJob);
				SCM(playerid,WHITE,string);
				playerVariable[playerid][pJobWorking] = true;
			} else {
				SCM(playerid,WHITE,UnrentCar);
			}
			return 1;
		}
		case 3801: {
		    if(response) {
		        SCM(playerid,WHITE,AccessRentCar);
		        playerVariable[playerid][pJobWorking] = true;
			} else {
			    SCM(playerid,WHITE,UnrentCar);
			}
			return 1;
		}

		// A D M I N
		case 5000: {}
		case 5001: {
		    if(response) {
				if(strlen(inputtext) != 0 && !strcmp(inputtext,adminVariable[playerid][aPassword],false)) {
					adminVariable[playerid][aLogged]=true;
					
				    format(string,sizeof(string),"%s Вы успешно авторизовались как %s[%i]",PrefixAdmLime,playerVariable[playerid][pAdmin],
					adminSystemVariable[playerVariable[playerid][pAdmin]][aName],playerVariable[playerid][pAdmin]);
					SCM(playerid,WHITE,string);

					format(string,sizeof(string),"%s %s[%i] авторизовался как %s[%i]",PrefixAdmLime,playerVariable[playerid][pName],playerid,
					adminSystemVariable[playerVariable[playerid][pAdmin]][aName],playerVariable[playerid][pAdmin]);
					SendAdminChat(playerid,WHITE,string,playerVariable[playerid][pAdmin],false);
				} else {
					++adminVariable[playerid][aWrongPassword];
					
					format(string,sizeof(string),"%s Неверный пароль!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
					
					if(adminVariable[playerid][aWrongPassword]==3) {
					    format(string,sizeof(string),"%s Администратор %s[%i] ввёл 3 раза неправильно свой админ-пароль!",PrefixSecurity,playerVariable[playerid][pName],playerid);
						SendAdminChat(playerid,WHITE,string);
						Kick(playerid);
					}
				}
			} else {
			
			}
			return 1;
		}
		case 5002: {
			if(response) {
				switch(listitem) {
					case 0: {}
					case 1: {}
					case 2: {}
					case 3: {}
					case 4: {}
					case 5: {}
					case 6: {}
					case 7: {}
					case 8: {}
					case 9: {
						if(adminVariable[playerid][aLVL]<5) return SCM(playerid,WHITE,AdmNotAccess);
						new bizID = FindNearestBuisness(playerid);
						if(bizID==-1) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] Рядом с Вами нет бизнеса!");
						SPD(playerid,531,DSM,"Изъятие бизнеса","","Далее","Назад");
					}
					case 10: {}
				}
			}
			else {

			}
			return 1;
		}
		case 5003: {
			if(response) {
			    if(playerVariable[playerid][pAdmin]>1) {
					DialogAhelp(playerid,1);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {

			}
			return 1;
		}
		case 5004: {
			if(response) {
			    if(playerVariable[playerid][pAdmin]>2) {
					DialogAhelp(playerid,2);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,0);
			}
			return 1;
		}
		case 5005: {
			if(response) {
			    if(playerVariable[playerid][pAdmin]>3) {
					DialogAhelp(playerid,3);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,1);
			}
			return 1;
		}
		case 5006: {
			if(response) {
			    if(playerVariable[playerid][pAdmin]>4) {
					DialogAhelp(playerid,4);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,2);
			}
			return 1;
		}
		case 5007: {
			if(response) {
				if(playerVariable[playerid][pAdmin]>5) {
					DialogAhelp(playerid,5);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,3);
			}
			return 1;
		}
		case 5008: {
			if(response) {
				if(playerVariable[playerid][pAdmin]>6) {
					DialogAhelp(playerid,6);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,4);
			}
			return 1;
		}
		case 5009: {
			if(response) {
			    if(playerVariable[playerid][pAdmin]>7) {
					DialogAhelp(playerid,7);
				} else {
					format(string,sizeof(string),"%s Нет доступа!",PrefixAdmRed);
					SCM(playerid,WHITE,string);
				}
			} else {
				DialogAhelp(playerid,5);
			}
			return 1;
		}
		case 5010: {
			if(response) {

			} else {
				DialogAhelp(playerid,6);
			}
			return 1;
		} case 527: {
			if(response)
			{
				format(query,sizeof(query),"SELECT `ID` FROM `organization members` WHERE `OrgID` = %i AND `OrgRank` = 10 LIMIT 1",listitem+1);
				mysql_query(MySQL:DATABASE,query);
				cache_get_row_count(rows);
				if(rows>0) return SCM(playerid,WHITE,"[{FF2424}ADM{FFFFFF}] У этой организации есть лидер!");
				format(string,sizeof(string),"Администратор %s[%i] назначил игрока %s[%i] на пост лидера организации %s!",
				playerVariable[playerid][pName],playerid);
				SendAdminChat(playerid,WHITE,string);
			}
			else return 1;
		}
		case 531: {
			if(response) {
				format(query,sizeof(query),"UPDATE `buisnesses` SET .. WHERE `ID` = %i");
				mysql_tquery(MySQL:DATABASE,query);
			} else {
				DialogApanel(playerid,0);
			}
			return 1;
		}
		// RADIO
		case 7000: {
			if(response) {
	   			DialogRadio(playerid,listitem + 1);
			} else {

			}
			return 1;
		} case 7003: {
			if(response) {
				DialogRadioRecord(playerid,listitem + 1);
			} else {
				DialogRadio(playerid,0);
			}
			return 1;
		} case 7004: {
			if(response) {
				DialogRadioEuropa(playerid,listitem + 1);
			} else {
				DialogRadio(playerid,0);
			}
			return 1;
		} case 7005: {
			if(response) {
				DialogRadioDFM1(playerid,listitem + 1);
			} else {
				DialogRadio(playerid,0);
			}
			return 1;
		} case 7006: {
			if(response) {
				DialogRadioDFM2(playerid,listitem + 1);
			} else {
				DialogRadioDFM1(playerid,0);
			}
		} case 7007: {
		    if(response) {
				DialogRadioDFM3(playerid,listitem + 1);
			} else {
				DialogRadioDFM2(playerid,0);
			}
		} case 7017: {
			if(response) {
			    DialogRadioZaycev(playerid,listitem + 1);
			} else {
				DialogRadio(playerid,0);
			}
			return 1;
		} case 7018: {
			if(response) {
				DialogRadioMonteCarlo(playerid,listitem + 1);
			} else {
				DialogRadio(playerid,0);
			}
			return 1;
		}
		// GPS
		case 7100: {
		    if(response) {
				DialogGPS(playerid,listitem + 1);
			} else {

			}
			return 1;
		} case 7101: {
			if(response) {
				switch(listitem) {
					case 0: SPC(playerid,0.0,0.0,0.0,5);
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} case 7102: {
			if(response) {
				switch(listitem) {
					case 0: SPC(playerid,2386.4734,2465.9463,10.8203,5); // + gover
					case 1: SPC(playerid,2444.8689,2376.2734,12.1635,5); // + fbi
					case 2: SPC(playerid,2290.1265,2431.2390,10.8203,5); // + police
					case 3: SPC(playerid,0.0,0.0,0.0,5); // army
					case 4: SPC(playerid,1607.2726,1819.1359,10.8280,5); // + hosp
					case 5: SPC(playerid,0.0,0.0,0.0,5); // smi
					case 6: SPC(playerid,0.0,0.0,0.0,5); // drive
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} case 7103: {
			if(response) {
				switch(listitem) {
					case 0: SPC(playerid,938.5411,1733.1899,8.851600,5); // irish
					case 1: SPC(playerid,1457.9207,2773.5466,10.8203,5); // yakuza
					case 2: SPC(playerid,1880.2577,2339.4983,10.9799,5); // center
					case 3: SPC(playerid,1532.3008,751.0519,11.02340,5); // lcn
					case 4: SPC(playerid,2632.8416,1824.2480,11.0234,5); // chine town
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} case 7104: {
			if(response) {
				switch(listitem) {
					case 0: SetPlayerCheckpoint(playerid,2783.1787,1281.4631,10.7500,5);
					case 1: SetPlayerCheckpoint(playerid,2467.8311,1322.5732,10.7014,5);
					case 2: SetPlayerCheckpoint(playerid,2087.2007,1433.1699,10.6719,5);
					case 3: SetPlayerCheckpoint(playerid,2236.6892,2773.2922,10.7343,5);
					case 4: SetPlayerCheckpoint(playerid,2368.6514,2018.3480,10.8203,5);
					case 5: SetPlayerCheckpoint(playerid,1727.4645,2303.1543,10.8218,5);
					case 6: SetPlayerCheckpoint(playerid,288.2519,1412.1256,10.3864,5);
					case 7: SetPlayerCheckpoint(playerid,2422.7266,2325.7021,10.6719,5);
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} case 7105: {
			if(response) {
				switch(listitem) {
					case 0: 1;
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} case 7106: {
			if(response) {
				switch(listitem) {
					case 0: 1;
				}
			} else {
				DialogGPS(playerid,0);
			}
			return 1;
		} default: {
			SCM(playerid,WHITE,"CASE not found");
		}
    }
	return 1;
}

public OnPlayerClickPlayer(playerid,clickedplayerid,source)				     	// Кликнули на игрока в TAB-e
{
	return 1;
}

public Advertisement1() {
	SCMtA(WHITE,"Сервер находится в активной разработке! Разработчик: Gino Mangano");
	SCMtA(WHITE,"Планируемая дата открытия сервера - 01.01.2023!");
	return 1;
}

public Advertisement2() {
	SCMtA(WHITE,"Идет разработка офф.сайта и форума сервера");
	SCMtA(WHITE,"Планируемая дата создания - 01.06.2023!");
	return 1;
}

public UpdatePlayedTime() {
	foreach(new i:Player) {
	    if(playerVariable[i][pAFK]<300) {
		    if(playerVariable[i][pPlayedTime]<60) {
				playerVariable[i][pPlayedTime] += 1;
				SaveVariableInteger("account","PlayedTime",playerVariable[i][pPlayedTime],playerVariable[i][pID]);
			}
		}
	}
	new hour,minut,second;
	gettime(hour,minut,second);
	if(minut==0) PayDay(false);
	return 1;
}

public DeacreasingFuel() {
	forveh(i) {
		if(vehicleVariable[i][vEngine]==false) continue;
		if(vehicleVariable[i][vFuel]>0) vehicleVariable[i][vFuel]-=1;
	}
	return 1;
}

public UpdateSpeed(playerid) {
	new carID = GetPlayerVehicleID(playerid);
	format(string,sizeof(string),"SPEED: %d",SpeedVehicle(playerid));
	PlayerTextDrawSetString(playerid,CarSpeed[playerid],string);
	format(string,sizeof(string),"FUEL: %d",vehicleVariable[carID][vFuel]);
	PlayerTextDrawSetString(playerid,CarFuel[playerid],string);
	format(string,sizeof(string),"MILLIAGE: %d",vehicleVariable[carID][vMilliage]);
	PlayerTextDrawSetString(playerid,CarMilliage[playerid],string);
	
	if(vehicleVariable[carID][vLights]==true) PlayerTextDrawSetString(playerid,CarLights[playerid],"~w~L");
	else PlayerTextDrawSetString(playerid,CarLights[playerid],"~b~L");
	
	if(vehicleVariable[carID][vEngine]==true) PlayerTextDrawSetString(playerid,CarEngine[playerid],"~w~E");
	else PlayerTextDrawSetString(playerid,CarEngine[playerid],"~b~E");
	
	if(vehicleVariable[carID][vFuel]<=0) {
	    vehicleVariable[carID][vEngine]=false;
	    vehicleVariable[carID][vFuel]=0;
	    SetVehicleParams(carID);
	}
	if(GetPlayerDistanceFromPoint(playerid,vehicleVariable[carID][vX],vehicleVariable[carID][vY],vehicleVariable[carID][vZ])>500.0) {
	    vehicleVariable[carID][vMilliage]+=1;
	    GetPlayerPos(playerid,vehicleVariable[carID][vX],vehicleVariable[carID][vY],vehicleVariable[carID][vZ]);
	}
	return 1;
}

public SystemAFK() {
	foreach(new i: Player) {
		if(!IsPlayerConnected(i)) continue;
		if(IsPlayerNPC(i)) continue;
		++playerVariable[i][pAFK];
  		if(playerVariable[i][pAFK] >= 3) {
		    new minuts = playerVariable[i][pAFK] / 60;
		    new seconds = playerVariable[i][pAFK] - minuts * 60;
			format(string,sizeof(string),"[AFK] %i:%i",minuts,seconds);
			SetPlayerChatBubble(i,string,WHITE,DISTANCE_BETWEEN_PLAYERS,1000);
		}
	}
	return 1;
}

public UpdatePlayer(playerid) {
	return 1;
}

public LoadInfoServer() {
	new	temp = GetTickCount();
	cache_get_row_count(rows);
	if(rows == 1) {
		cache_get_value_name(0,"NameServer",ServerName,32);
		cache_get_value_name(0,"SiteServer",ServerSite,32);
		cache_get_value_name(0,"LangueServer",ServerLangue,11);
		cache_get_value_name(0,"NumServer",ServerNum,5);
		cache_get_value_name(0,"ClientServer",ServerClient,7);
		cache_get_value_name(0,"MapServer",ServerMap,12);
	}
	string[0] = EOS;
	format(string,72,"hostname %s | Year: %s",ServerName,ServerNum);
	SendRconCommand(string);
	string[0] = EOS;
	format(string,20,"mapname %s",ServerMap);
	SendRconCommand(string);
	string[0] = EOS;
	format(string,18,"language %s",ServerLangue);
	SendRconCommand(string);
	string[0] = EOS;
	format(string,39,"weburl %s",ServerSite);
	SendRconCommand(string);
	SetGameModeText("Role Play");
	printf("[Загружена информация]: <->. Потрачено: <%i мс>",GetTickCount()-temp);
	return 1;
}


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// 369.1738,173.6454,1019.9844 spawn point in govern
