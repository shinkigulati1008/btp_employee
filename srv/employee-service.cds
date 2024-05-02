using btp.j as bj from '../db/data-model';

service EmployeeServices {
    entity Employees @(
        Capabilities : {
            InsertRestrictions : {
                $Type : 'Capabilities.InsertRestrictionsType',
                Insertable
            },
            UpdateRestrictions : {
                $Type : 'Capabilities.UpdateRestrictionsType',
                Updatable
            },
            DeleteRestrictions : {
                $Type : 'Capabilities.DeleteRestrictionsType',
                Deletable
            }
        }
    ) 
    as select from bj.EMPLOYEE_REGISTRY;
    annotate Employees with @odata.draft.enabled;
    
    @readonly entity Department as select from bj.DEPARTMENT;
    annotate Department with @odata.draft.enabled;
       
}

annotate EmployeeServices.Employees with @(
  UI: {
        //filter bar
        SelectionFields  : [
            DEPARTMENT_ID
        ],
        //table column
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : EMAIL_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : DEPARTMENT_ID,
            }
        ],
    }
    ){
    NAME        @title : 'Name';
    EMAIL_ID    @title : 'Email ID';
    DEPARTMENT  @(
        title : 'Department',
        //link to Department entity
        Common : {
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Department',
                Label : 'Department',
                Parameters: [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : DEPARTMENT_ID,
                        ValueListProperty : 'ID',
                    },
                    {
                         $Type : 'Common.ValueListParameterDisplayOnly',
                         ValueListProperty : 'NAME',
                    }
                ]
            },         
            
        }

    );
};
