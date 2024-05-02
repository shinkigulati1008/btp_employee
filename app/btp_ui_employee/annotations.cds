using EmployeeServices as service from '../../srv/employee-service';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
    },
    UI.FieldGroup #AdminGroup :{
        $Type : 'UI.FieldGroupType',
        Data :[
            { 
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            { 
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            { 
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            { 
                $Type : 'UI.DataField',
                Value : modifiedBy,
            }
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'Admin Information',
            Target : '@UI.FieldGroup#AdminGroup',
        }
    ],
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Employee',
        TypeNamePlural : 'Employees',
    }
);

